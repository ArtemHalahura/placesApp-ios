import ComposableArchitecture

@Reducer
struct AppReducer {
    struct State: Equatable { }
    
    enum Action { }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}
