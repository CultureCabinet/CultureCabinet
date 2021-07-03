
import Foundation

class UserInformation{
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var introduce: String?
    var phoneNumber: String?
    var birthDay: String?
}
