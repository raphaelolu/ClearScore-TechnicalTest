
import Foundation

protocol NetworkServiceProtocol {
    func fetchData(completed:@escaping(Result<CreditReportModel,CustomError>)-> Void)
}

