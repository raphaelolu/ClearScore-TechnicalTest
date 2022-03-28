
import Foundation

struct CreditReportModel:Codable {
    
 let accountIDVStatus: String
 let creditReportInfo: CreditReportInfo
 let dashboardStatus, personaType: String
 let coachingSummary: CoachingSummary
 let augmentedCreditScore: Int?
}
