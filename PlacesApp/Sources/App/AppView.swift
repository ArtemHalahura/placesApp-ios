import SwiftUI
import ComposableArchitecture

struct AppView: View {
    let store: StoreOf<AppReducer>
    
    var body: some View {
        TabView {
            PlacesListView(
                store: store.scope(state: \.places,
                                   action: \.places)
            )
            .tabItem {
                Image(systemName: "map")
                Text("Places")
            }
        }
    }
}

#Preview {
    AppView(
        store: Store(initialState: AppReducer.State()) {
            AppReducer()
        }
    )
}
