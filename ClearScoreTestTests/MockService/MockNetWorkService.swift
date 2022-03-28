//
//  ClearScoreTestTests.swift
//  ClearScoreTestTests
//
//  Created by raphael olumofe on 23/03/2022.
//

import XCTest
@testable import ClearScoreTest

final class MockNetWorkService:NetworkServiceProtocol {
    
    func fetchData(completed: @escaping (Result<CreditReportModel, CustomError>) -> Void) {
        completed(.success(testData))
    }
    
let testData = CreditReportModel(accountIDVStatus: "PASS", creditReportInfo: ClearScoreTest.CreditReportInfo(score: 514, scoreBand: 4, clientRef: "CS-SED-655426-708782", status: "MATCH", maxScoreValue: 700, minScoreValue: 0, monthsSinceLastDefaulted: -1, hasEverDefaulted: false, monthsSinceLastDelinquent: 1, hasEverBeenDelinquent: true, percentageCreditUsed: 44, percentageCreditUsedDirectionFlag: 1, changedScore: 0, currentShortTermDebt: 13758, currentShortTermNonPromotionalDebt: 13758, currentShortTermCreditLimit: 30600, currentShortTermCreditUtilisation: 44, changeInShortTermDebt: 549, currentLongTermDebt: 24682, currentLongTermNonPromotionalDebt: 24682, currentLongTermCreditLimit: nil, currentLongTermCreditUtilisation: nil, changeInLongTermDebt: -327, numPositiveScoreFactors: 9, numNegativeScoreFactors: 0, equifaxScoreBand: 4, equifaxScoreBandDescription: "Excellent", daysUntilNextReport: 9), dashboardStatus: "PASS", personaType: "INEXPERIENCED", coachingSummary: ClearScoreTest.CoachingSummary(activeTodo: false, activeChat: true, numberOfTodoItems: 0, numberOfCompletedTodoItems: 0, selected: true), augmentedCreditScore: nil)
}




