//
//  AuthenticationViewModel.swift
//  SwiftBeta-SPM-Modulos
//
//  Created by Home on 7/11/21.
//

import Foundation

public enum LoginStatus {
    case success
    case error
}

final public class AuthenticationViewModel: ObservableObject {
    @Published public var loginStatus: LoginStatus = .success
    @Published public var didUpdateLoginStatus: Bool = false
    
    public init() { }
    
    public func login(email: String, password: String) {
        if email.lowercased() == "swiftbeta.blog@gmail.com" {
            loginStatus = .success
        } else {
            loginStatus = .error
        }
        didUpdateLoginStatus = true
    }
    
    func signup(email: String, password: String) {
        print("registrarse...")
    }
    
    func recoverPassword(email: String) {
        print("Recuperar contraseña...")
    }
}
