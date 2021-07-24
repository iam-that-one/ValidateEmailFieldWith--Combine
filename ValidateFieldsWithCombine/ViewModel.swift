//
//  ViewModel.swift
//  ValidateFieldsWithCombine
//
//  Created by Abdullah Alnutayfi on 24/07/2021.
//

import Foundation
import SwiftUI
import Combine
class ViewModel : ObservableObject{
    
    var isValid = CurrentValueSubject<Bool, Never>(false)
    var email = CurrentValueSubject<String, Never>("")
  
    let checkEmail = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
    var subscribtionSet : Set<AnyCancellable> = []
    init() {
        email
            .map { email in
                self.objectWillChange.send()
                return self.checkEmail.evaluate(with: email)
            }
            .assign(to:\.isValid.value, on: self)
            .store(in: &subscribtionSet)
        
   
        
    }
    var emailPrompt : String{
        isValid.value ? "" : "Please, Enter a valid email"
    }

    
}

enum ErrorMesssage {
    case invalidEmail
    case validEmail
    var message : String{
        switch self{
        case .invalidEmail:
            return "invalid Email"
        case .validEmail:
            return "valid Email"
        }
       
    }
}
