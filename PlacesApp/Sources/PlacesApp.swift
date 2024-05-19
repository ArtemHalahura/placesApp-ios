import SwiftUI
import ComposableArchitecture

@main
struct PlacesApp: App {
    static let store = Store(initialState: AppReducer.State()) {
        AppReducer()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: PlacesApp.store)
        }
    }
}
