import XCTest
import ComposableArchitecture
@testable import PlacesApp

final class AppReducerTests: XCTestCase {
    
    var sut: TestStore<AppReducer.State, AppReducer.Action>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut =  TestStore(initialState: AppReducer.State()) {
            AppReducer()
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
}
