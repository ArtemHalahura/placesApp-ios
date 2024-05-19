import ComposableArchitecture
import Foundation

struct PlacesListClient {
    var fetch: () async throws -> [Place]
}

extension PlacesListClient: DependencyKey {
    
    private static let mockData = [
        Place(id: UUID(),
              name: "Amsterdam",
              lat: 52.3547498,
              long: 4.8339215),
        Place(id: UUID(),
              name: "Mumbai",
              lat: 19.0823998,
              long: 72.8111468),
        Place(id: UUID(),
              name: "Copenhagen",
              lat: 55.6713442,
              long: 12.523785),
        Place(id: UUID(),
              name: "",
              lat: 40.4380638,
              long: -3.7495758)
    ]
    
    static let liveValue = Self(fetch: {
#if DEBUG
        try await Task.sleep(for: .seconds(1))
        return mockData
        
#else
        //TODO: - API call
        
#endif
        
    })
}

extension DependencyValues {
    var placesClient: PlacesListClient {
        get { self[PlacesListClient.self] }
        set { self[PlacesListClient.self] = newValue }
    }
}
