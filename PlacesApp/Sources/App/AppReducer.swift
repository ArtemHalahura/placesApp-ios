import ComposableArchitecture

@Reducer
struct AppReducer {
    struct State: Equatable { 
        var places = PlacesListReducer.State()
    }
    
    enum Action { 
        case places(PlacesListReducer.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.places,
              action: \.places) {
            PlacesListReducer()
        }
        Reduce { state, action in
            return .none
        }
    }
}
