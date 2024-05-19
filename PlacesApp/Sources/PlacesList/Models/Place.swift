import Foundation

struct Place: Equatable, Identifiable {
    let id: UUID
    let name: String
    let lat: Double
    let long: Double
}
