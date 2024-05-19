import ComposableArchitecture
import Foundation

struct PlacesListClient {
    var fetch: () async throws -> [Place]
}

extension PlacesListClient: DependencyKey {
    
    private static let mockData = [
        Place(name: "Amsterdam",
              lat: 52.3547498,
              long: 4.8339215),
        Place(name: "Mumbai",
              lat: 19.0823998,
              long: 72.8111468),
        Place(name: "Copenhagen",
              lat: 55.6713442,
              long: 12.523785),
        Place(name: "",
              lat: 40.4380638,
              long: -3.7495758)
    ]
    
    static let liveValue = Self(fetch: {
#if DEBUG
        try await Task.sleep(for: .seconds(1))
        return mockData
        
#else
        let (data, _) = try await URLSession.shared
          .data(from: URL(string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json")!)
        let response = try JSONDecoder().decode(LocationsResponse.self, from: data)
        let places = response.locations.map { Place(name: $0.name ?? "",
                                                    lat: $0.lat,
                                                    long: $0.long)}
        return places
        
#endif
        
    })
}

extension DependencyValues {
    var placesClient: PlacesListClient {
        get { self[PlacesListClient.self] }
        set { self[PlacesListClient.self] = newValue }
    }
}
