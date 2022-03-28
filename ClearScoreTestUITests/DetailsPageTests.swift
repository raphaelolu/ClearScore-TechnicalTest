

import XCTest

class DetailsPageTests: XCTestCase {
    
    func testLabelsAreDisplayingCorrectInformation() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let detailsButton = app.buttons.staticTexts["Details"]
        detailsButton.tap()
        let scoreBandDescription = app.staticTexts["scoreBandLabel"]
        let scoreBandValue = app.staticTexts["scoreBandValue"]
        let haveDefaultedLabel =  app.staticTexts["haveEverDefaultedLabel"]
        let haveDefaultedValue = app.staticTexts["haveEverDefaultedValue"]
        let percentageCreditLabel = app.staticTexts["percentageCreditLabel"]
        let percentageCreditValue = app.staticTexts["percentageCreditValue"]
        
        XCTAssertEqual(scoreBandDescription.label,"Score band description")
        XCTAssertEqual(scoreBandValue.label,"Excellent")
        XCTAssertEqual(haveDefaultedLabel.label,"Have ever defaulted")
        XCTAssertEqual(haveDefaultedValue.label,"false")
        XCTAssertEqual(percentageCreditLabel.label,"Percentage credit used")
        XCTAssertEqual(percentageCreditValue.label,"44")
    }
}
