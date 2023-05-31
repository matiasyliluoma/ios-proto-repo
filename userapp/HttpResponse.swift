//
//  HttpResponse.swift
//  userapp
//
//  Created by Matias Yliluoma on 30.5.2023.
//

import Foundation
import Alamofire


/// Fetches user data from the server.
/// - Parameter completion: A closure that is called with the fetched user data or an error.
 
 

struct HttpResponse {
    static func makeRequest(completion: @escaping (Result<UserModel, Error>) -> Void) {
        AF.request("https://dummyjson.com/users").responseDecodable(of: UserModel.self) { response in
            switch response.result {
            case .success(let userModel):
                completion(.success(userModel))
                print("matias \(response.value?.users)")
            case .failure(let error):
                let mappedError = error as Error // Map AFError to generic Error
                completion(.failure(mappedError))
            }
        }
    }
}
