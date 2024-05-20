import XCTest
import ComposableArchitecture
@testable import PlacesApp

@MainActor
final class PlacesListReducerTests: XCTestCase {
    
    var sut: TestStore<PlacesListReducer.State, PlacesListReducer.Action>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut =  TestStore(initialState: PlacesListReducer.State()) {
            PlacesListReducer()
        } withDependencies: {
            $0.placesClient.fetch = {[
                Place(id: UUID(1), name: "Place 1", lat: 0.0, long: 0.0),
                Place(id: UUID(2), name: "Place 2", lat: 1.0, long: 1.0)
            ]}
        }
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Initial
    func testCreateFeature_notNil() {
        XCTAssertNotNil(sut)
    }
    
    // MARK: - Places
    func testFetchPlaces() async {
        let places = [
            Place(id: UUID(1), name: "Place 1", lat: 0.0, long: 0.0),
            Place(id: UUID(2), name: "Place 2", lat: 1.0, long: 1.0)
        ]
        
        await sut.send(.fetchPlaces) {
            $0.isLoading = true
        }
        
        await sut.receive(\.placesResponse) {
            $0.isLoading = false
            $0.places = places
        }
    }
    
    func testPlacesResponse() async {
        let places = [
            Place(id: UUID(), name: "Place 1", lat: 0.0, long: 0.0),
            Place(id: UUID(), name: "Place 2", lat: 1.0, long: 1.0)
        ]
        
        await sut.send(.placesResponse(places)) {
            $0.isLoading = false
            $0.places = places
        }
    }
    
    func testOpenURL() async {
        let place = Place(id: UUID(), name: "Place 1", lat: 0.0, long: 0.0)
        
        await sut.send(.openURL(place))
    }
}
