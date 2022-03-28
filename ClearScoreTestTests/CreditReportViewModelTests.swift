
import XCTest
@testable import ClearScoreTest

class CreditReportViewModelTests: XCTestCase {
    
    var viewModel: CreditReportViewModel!
    var mockNetworkService: MockNetWorkService!
    
    override func setUp(){
        mockNetworkService = MockNetWorkService()
        viewModel = .init(service: mockNetworkService)
        viewModel.fetchData()
    }
    
    func testCreditScoreDetailsObjectContainsCorrectValuesUnderSucessCase(){
        
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut{
            XCTAssertNotNil(viewModel.creditReportdetails)
            XCTAssertEqual(viewModel.creditReportdetails?.creditReportInfo.score,514)
            XCTAssertEqual(viewModel.creditReportdetails?.creditReportInfo.clientRef,"CS-SED-655426-708782")
            XCTAssertEqual(viewModel.creditReportdetails?.creditReportInfo.scoreBand,4)
            XCTAssertEqual(viewModel.creditReportdetails?.creditReportInfo.equifaxScoreBandDescription,"Excellent")
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testCreditScoreDetailsObjectIsCreatedUnderSuccesssCase(){
        
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut{
            XCTAssertNotNil(viewModel.creditReportdetails)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testErrorObjectIsCreatedUnderSuccessCase(){
        
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut{
            XCTAssertNotNil(viewModel.errorObject)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testErrorObjectContainsCorrectDetailsUnderSuccessCase(){
        
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut{
            XCTAssertNil(viewModel.errorObject?.errorDesription)
            XCTAssertEqual(viewModel.errorObject?.errorFlag,false)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
