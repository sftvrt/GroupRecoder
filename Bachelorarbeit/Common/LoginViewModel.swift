//
//  LoginViewModel.swift
//  Bachelorarbeit
//
//  Created by JT X on 10.08.22.
//

import Foundation

import Foundation

class LoginViewModel: ObservableObject {
    
    var webService = Webservice()
    
    var username: String = "GroupRecorder"
   
    var password: String = "78zsd78fsd87fg8sdf9na09df"
   
    var type: String = "local"
    //var username: String = ""
    //var password: String = ""
    
    
    /*
    func login(){
        Webservice().login(type: type, username: username, password: password) {
            result in
            switch result {
            case .success(let JWT):
                print(JWT)
            case .failure(let error):
                print(error.localizedDescription)
                print("")
            }
        }
    }
    */
    func login(){
        Webservice().login(type: type, username: username, password: password) { 
            result in
            switch result {
          //  case .success(let JWT):
          //      print(JWT)
            case .success(let need):
              //  print(need)
                print(1)
            case .failure(let error):
                //print(error.localizedDescription)
                print("")
            }
            
             
            
            
            
        }
    }
}


