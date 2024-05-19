import SwiftUI
import ComposableArchitecture

struct PlacesListView: View {
    let store: StoreOf<PlacesListReducer>
    
    var body: some View {
        List(store.places) { place in
            GroupBox {
                Text(place.name)
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        } .overlay {
            if store.isLoading {
                ProgressView()
                    .padding()
                    .background(.black.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
            }
        }
        .navigationTitle("Places")
        .listStyle(.plain)
        .onAppear {
            if store.places.isEmpty {
                store.send(.fetchPlaces)
            }
        }
        .padding()
    }
}

#Preview {
    PlacesListView(
        store: Store(initialState: PlacesListReducer.State(), 
                     reducer: {
                         PlacesListReducer()
                     }))
}
