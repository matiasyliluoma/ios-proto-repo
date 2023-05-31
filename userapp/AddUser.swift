//
//  AddUser.swift
//  userapp
//
//  Created by Matias Yliluoma on 30.5.2023.
//

import Foundation
import Alamofire

 
/// Struct for adding users.
/// - Parameter completion: callback/closure to update state variable users
///  to update the list and ui
 
 

struct AddUser {
    static func adding(addFirst : String, addLast : String, to users : [UserArray], completion : @escaping ([UserArray]) -> Void) {
        let newUser = UserArray(id : users.count + 1, firstName : addFirst, lastName : addLast)
        
        var updatedUsers = users
        updatedUsers.append(newUser)
   //     userToServer(newUser: UserArray)
        completion(updatedUsers)
    }
    
    
}
/**
 
 func userToServer to simulate user adding to server
 */
/*
func userToServer(newUser : UserArray) {
    let parameters: [String: Any] = [
            "users": [newUser]
        ]
    Alamofire.request(.post, "https://dummyjson.com/users/add", parameters: parameters, encoding: .JSONEncoding.default)
        .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        print("Request successful")
                        print(value)
                        
                    case .failure(let error):
                        print("Request failed: \(error)")
                        
                    }
                }
        }*/
