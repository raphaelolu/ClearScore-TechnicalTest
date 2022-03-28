
import Foundation
import Combine
class NetworkService:NetworkServiceProtocol {
    
    func fetchData(completed:@escaping(Result<CreditReportModel,CustomError>) -> Void ){
        guard let url = URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values") else{return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data,error == nil else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let creditScoreDetails  = try JSONDecoder().decode(CreditReportModel.self, from: data)
                completed(.success(creditScoreDetails))
            }
            catch {
                completed(.failure(.unableToComplete))
                print(error)
            }
        }
        task.resume()
    }
}
