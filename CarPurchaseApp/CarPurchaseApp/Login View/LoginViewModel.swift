//
//  LoginViewModel.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 07/07/25.
//

import Foundation
import Combine


class LoginViewModel: ObservableObject {
    @Published var userEmail: String = ""
    @Published var userPassword: String = ""
    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    @Published var isSignInEnable: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    init(){
        setupBinding()
    }
    
      private var isEmailValidPublisher: AnyPublisher<Bool, Never> {
        $userEmail
            .map { email in
                let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                print("emailPredicate.evaluate(with: email) \(emailPredicate.evaluate(with: email))")
                return emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
    }
    
    // Combile all the publishers to validate using "Publishers.CombineLatest" key word
    private var isSignInValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isEmailValidPublisher, isPasswordValidPublisher)
            .map{  isEmail, isPassword in
                print("isEmailValid && isPasswordValid \(isPassword && isEmail)")
                return isEmail && isPassword
            }
            .eraseToAnyPublisher()
    }
           
    private  var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $userPassword
            .map {  password in
                print("password.count >= 8 \(password.count >= 8)")
                return password.count >= 8
            }
            .eraseToAnyPublisher()
    }
    
    private func setupBinding(){
        
        isEmailValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isEmailValid, on: self)
            .store(in: &cancellables)
        
        
        isPasswordValidPublisher
              .receive(on: RunLoop.main)
              .assign(to: \.isPasswordValid, on: self)
              .store(in: &cancellables)
        
        
        
        isSignInValidPublisher
              .receive(on: RunLoop.main)
              .assign(to: \.isSignInEnable, on: self)
              .store(in: &cancellables)
        
    }
}
