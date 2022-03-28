
import XCTest
@testable import ClearScoreTest

class NetworkCallTests: XCTestCase {

    func testCreditScoreDecodesAccurately() throws {
        let decoder = JSONDecoder()
        do {
            let creditData = try decoder.decode(CreditReportModel.self, from: cannedCreditData())
            XCTAssertEqual(creditData.creditReportInfo.score, 514)
            XCTAssertEqual(creditData.creditReportInfo.clientRef, "CS-SED-655426-708782")
            XCTAssertEqual(creditData.accountIDVStatus,"PASS")
            XCTAssertEqual(creditData.creditReportInfo.currentLongTermDebt,24682)
            XCTAssertEqual(creditData.creditReportInfo.numPositiveScoreFactors, 9)
            XCTAssertEqual(creditData.creditReportInfo.equifaxScoreBandDescription,"Excellent")
        } catch {
            XCTFail("Unexpected error: \(error).")
        }
    }
    
    func cannedCreditData() -> Data {
        let json = """
           {"accountIDVStatus":"PASS","creditReportInfo":{"score":514,"scoreBand":4,"clientRef":"CS-SED-655426-708782","status":"MATCH","maxScoreValue":700,"minScoreValue":0,"monthsSinceLastDefaulted":-1,"hasEverDefaulted":false,"monthsSinceLastDelinquent":1,"hasEverBeenDelinquent":true,"percentageCreditUsed":44,"percentageCreditUsedDirectionFlag":1,"changedScore":0,"currentShortTermDebt":13758,"currentShortTermNonPromotionalDebt":13758,"currentShortTermCreditLimit":30600,"currentShortTermCreditUtilisation":44,"changeInShortTermDebt":549,"currentLongTermDebt":24682,"currentLongTermNonPromotionalDebt":24682,"currentLongTermCreditLimit":null,"currentLongTermCreditUtilisation":null,"changeInLongTermDebt":-327,"numPositiveScoreFactors":9,"numNegativeScoreFactors":0,"equifaxScoreBand":4,"equifaxScoreBandDescription":"Excellent","daysUntilNextReport":9},"dashboardStatus":"PASS","personaType":"INEXPERIENCED","coachingSummary":{"activeTodo":false,"activeChat":true,"numberOfTodoItems":0,"numberOfCompletedTodoItems":0,"selected":true},"augmentedCreditScore":null}
           """
        return json.data(using: .utf8) ?? Data()
    }
}
