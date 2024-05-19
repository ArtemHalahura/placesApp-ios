import Foundation

struct Place: Equatable, Identifiable {
    let id: UUID
    let name: String
    let lat: Double
    let long: Double
    
    init(id: UUID = UUID(), name: String, lat: Double, long: Double) {
        self.id = id
        self.name = name
        self.lat = lat
        self.long = long
    }
}
