
import Foundation
import Combine

class CreditReportViewModel {
    @Published var creditReportdetails :CreditReportModel?
    private let service:NetworkServiceProtocol
    @Published var errorObject:ErrorObject?
    
    init(service:NetworkServiceProtocol = NetworkService()){
        self.service = service
    }
    
    func fetchData(){
        service.fetchData {[self] result in
            DispatchQueue.main.async {
                switch result {
                case.success(let creditReport):
                    self.creditReportdetails = creditReport
                    let errorDetails = ErrorObject()
                    errorDetails.errorFlag = false
                    self.errorObject = errorDetails
                 case.failure(let error):
                    let errorDetails = ErrorObject()
                    errorDetails.errorFlag = true
                    errorDetails.errorDesription = error.rawValue
                    self.errorObject = errorDetails
                }
            }
        }
    }
}
