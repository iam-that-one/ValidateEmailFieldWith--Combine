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
    var canSubmit = CurrentValueSubject<Bool, Never>(false)
    
    let checkEmail = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
    var subscribtionSet : Set<AnyCancellable> = []
    init() {
        email
            .map {email in
                return self.checkEmail.evaluate(with: email)
            }
            .assign(to:\.isValid.value, on: self)
            .store(in: &subscribtionSet)
        
            Publishers.CombineLatest(isValid, isValid).map{isValid, _ in
            self.objectWillChange.send()
            return isValid
        }
        
        .assign(to: \.canSubmit.value, on: self)
        .store(in: &subscribtionSet)
        
        
    }
    var emailPrompt : String{
        isValid.value ? "" : "Please, Enter a valid email"
    }
    
}
