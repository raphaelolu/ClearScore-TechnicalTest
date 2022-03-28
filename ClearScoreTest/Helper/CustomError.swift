
import Foundation

enum CustomError: String, Error{
    case invalidURL = "Invalid url"
    case unableToComplete  = "Unable to complete operation"
    case invalidResponse  = "Invalid Response"
    case invalidData  = "Invalid data"
}
