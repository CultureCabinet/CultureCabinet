
import Foundation

class UserInformation{
    
    static let shared: UserInformation = UserInformation()
    var category: Int?
    var content: String?
    var date: Date?
    var image: Data?
    var score: Float?
    var title: String?
    
}
