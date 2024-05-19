import Foundation
import ComposableArchitecture

@Reducer
struct PlacesListReducer {
    
    @ObservableState
    struct State: Equatable {
        var places: [Place] = []
        var isLoading = false
    }
    
    enum Action {
        case fetchPlaces
        case placesResponse([Place])
    }
    
    @Dependency(\.placesClient) var placesClient
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchPlaces:
                state.isLoading = true
                
                return .run { send in
                    try await send(.placesResponse(self.placesClient.fetch()))
                }
                
            case let .placesResponse(newPlaces):
                state.isLoading = false
                state.places = newPlaces
                
                return .none
            }
        }
    }
}
