struct Location: Codable {
    let name: String?
    let lat: Double
    let long: Double
}

struct LocationsResponse: Codable {
    let locations: [Location]
}
