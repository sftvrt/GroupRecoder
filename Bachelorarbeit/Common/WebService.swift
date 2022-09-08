//
//  WebService.swift
//  Bachelorarbeit
//
//  Created by JT X on 10.08.22.
//

import Foundation


enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage:String)
}

struct LoginRequestBody: Codable {
    let type: String
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let accessToken: String?
    let account: String?
    let generalRole: String?
    let username: String?
    let email : String?
    let loginmethod: String?
    let active : String?
    let gender : String?
    let first_name : String?
    let last_name : String?
    let organization : String?
    let birthday : String?
    let address : String?
    let address_details : String?
    let town : String?
    let postcode : String?
    let state : String?
    let country : String?
    let language : String?
    let timezone : String?
    let phone : String?
    let projectRoles : String?
}

class Webservice   {
    
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
          //Trust the certificate even if not valid
          let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)

          completionHandler(.useCredential, urlCredential)
       }
  //  let session = URLSession(configuration: URLSessionConfiguration.default, delegate: Self, delegateQueue: nil)
    
    func login(type: String,username: String, password: String, completion: @escaping(Result<String, AuthenticationError>) -> Void){
        

     /*
        guard let url = URL(string: "http://localhost:8080 ") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        */
        guard let webUrl = URL(string: "") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(type: type, username: username, password: password)
        
        var request = URLRequest(url:webUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("7z87mhgdf89n7dgfn8s7ßa9sdufm8", forHTTPHeaderField: "X-App-Token")
        request.httpBody = try? JSONEncoder().encode(body)
 
   
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
      //      guard let data = data else {
      //          return
      //      }
            
            print(String(data: try! JSONEncoder().encode(body), encoding: .utf8)!)
          
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "no data")))
                return
            }
            
        /*
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self,from: data) else {
                completion(.failure(.invalidCredentials))
                print("no loginResponse")
                return
            }
            print(loginResponse)
            */
            
         //   let JWTFile = String(data: data, encoding: .utf8)
            
        
          //  let jsonFile = try JSONSerialization.jsonObject(with:JWTFile , options: [])
   
            //kexing
            
            guard let need = String(data: data, encoding: .utf8) else {
                completion(.failure(.custom(errorMessage: "no need")))
                print("data")
                return
            }
            completion(.success(need))
            
        //    let loginResponse: LoginResponse = try! JSONDecoder().decode(LoginResponse.self, from: data)
         //   print(loginResponse)
            
            
            if(error != nil) {
                print("Error: \(String(describing: error))")
            } else {
              // print(String(data: data, encoding: .utf8)! )
            //    print(JWTFile as Any)
                print(data)
            }
            
            
            
            //kexing
            
            // A successful login request returns the JWT
            /*
            guard let JWT = loginResponse.JWT else {
                completion(.failure(.invalidCredentials))
                return
            }
            completion(.success(JWT))
           */
            
        }.resume()
    }
}


 
