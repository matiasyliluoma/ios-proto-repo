import Foundation

/// This struct is for decoding the json data
 
 
 
struct UserModel: Decodable {
    let users: [UserArray]
}

/// Items we want from json
/// where id is used for displaying users on UI in ContentView
 
 

struct UserArray: Decodable {
    let id: Int
    let firstName: String
    let lastName: String
}
