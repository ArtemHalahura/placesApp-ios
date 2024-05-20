import SwiftUI
import ComposableArchitecture

struct PlacesListView: View {
    let store: StoreOf<PlacesListReducer>
    
    var body: some View {
        NavigationStack {
            List(store.places) { place in
                GroupBox {
                    Text(place.name)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                    HStack {
                        Text("\(place.lat)")
                        Text("\(place.long)")
                    }
                    .font(.caption2)
                    .foregroundStyle(.gray)
                }
                .onTapGesture {
                    store.send(.openURL(place))
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
            .padding()
        }
        .onAppear {
            if store.places.isEmpty {
                store.send(.fetchPlaces)
            }
        }
    }
}

#Preview {
    PlacesListView(
        store: Store(initialState: PlacesListReducer.State(), 
                     reducer: {
                         PlacesListReducer()
                     }))
}
