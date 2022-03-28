
import XCTest

class ClearScoreTestUITests: XCTestCase {

    func testLabelsAreShowingCorrectValuesInSuccessCase() throws {

        let app = XCUIApplication()
        app.launch()
        let creditscorelabel = app/*@START_MENU_TOKEN@*/.staticTexts["creditScoreLabel"]/*[[".staticTexts[\"514\"]",".staticTexts[\"creditScoreLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let maxCreditScorelabel = app.staticTexts["maxCreditScoreLabel"]
        let titleLabel = app.staticTexts["titleLabel"]
        XCTAssertEqual(maxCreditScorelabel.label,"out of 700")
        XCTAssertEqual(creditscorelabel.label,"514")
        XCTAssertEqual(titleLabel.label,"Your credit score is")
    }
    
    func testDetailsButtonIsHittable(){
        let app = XCUIApplication()
        app.launch()
        let detailsButton = app.buttons.staticTexts["Details"]
        XCTAssertTrue(detailsButton.isHittable)
        XCTAssertTrue(detailsButton.isEnabled)
    }
}
