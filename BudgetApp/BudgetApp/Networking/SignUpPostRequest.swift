//
//  SignUpPostRequest.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/29/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation

struct HubspotPostRequest {
    let resourceURL: URL
    
    init() {
        let resourceString = "https://swizard.tech/api/login"
        guard let resourceURL = URL(string: resourceString) else { fatalError()}

        self.resourceURL = resourceURL
    }
    
    func sendPost(_ userToSend: User, completion: @escaping(Result<User, Error>) -> Void) {
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = try JSONEncoder().encode(userToSend)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(fatalError("Did not return 200")))
                    return
                }
                
                do {
                    let userData = try JSONDecoder().decode(User.self, from: jsonData)
                    completion(.success(userData))
                } catch {
                    completion(.failure(fatalError("Problem Decoding data")))
                }
            }
            dataTask.resume()
        } catch {
            completion(.failure(fatalError()))
        }
    }
}

