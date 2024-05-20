import ComposableArchitecture
import Foundation

struct PlacesListClient {
    var fetch: () async throws -> [Place]
}

extension PlacesListClient: DependencyKey {
    
    static let liveValue = Self(fetch: {
#if DEBUG
        try await Task.sleep(for: .seconds(1))
        
        guard let path = Bundle.main.path(forResource: "locations", ofType: "json") else {
            throw NSError(domain: "Invalid path", code: 1, userInfo: nil)
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        
#else
        let (data, _) = try await URLSession.shared
          .data(from: URL(string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json")!)
        
#endif
        
        let response = try JSONDecoder().decode(LocationsResponse.self, from: data)
        let places = response.locations.map { Place(name: $0.name ?? "",
                                                    lat: $0.lat,
                                                    long: $0.long)}
        return places
        
    })
}

extension DependencyValues {
    var placesClient: PlacesListClient {
        get { self[PlacesListClient.self] }
        set { self[PlacesListClient.self] = newValue }
    }
}
