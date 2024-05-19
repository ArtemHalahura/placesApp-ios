import SwiftUI
import ComposableArchitecture

struct AppView: View {
    let store: StoreOf<AppReducer>
    
    var body: some View {
        TabView {
            Text("Places")
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
