//
//  ContentView.swift
//  SwiftBeta-SPM-Modulos
//
//  Created by Home on 7/11/21.
//

import SwiftUI

public struct ContentView: View {
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    @State var email: String = ""
    @State var password: String = ""
    
    public init() { }
    
    public var body: some View {
        VStack {
            Image("swiftbeta", bundle: .module)
                .resizable()
                .frame(width: 200, height: 200)
            Group {
                HStack {
                    Image(systemName: "envelope.fill")
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }
                HStack {
                    Image(systemName: "key.fill")
                    TextField("Password", text: $password)
                        .keyboardType(.emailAddress)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.black, lineWidth: 1)
            )
            .padding(.horizontal, 80)
            Button("Login") {
                authenticationViewModel.login(email: email, password: password)
            }
            .buttonStyle(.bordered)
            .tint(.black)
            Text("Suscríbete a SwiftBeta para apoyar el canal")
                .font(.footnote)
                .underline()
                .foregroundStyle(.tertiary)
                .padding(.top, 40)
            Spacer()
        }
        .alert(authenticationViewModel.loginStatus == .success ? "Login Success" : "Login Error", isPresented: $authenticationViewModel.didUpdateLoginStatus) {
            Button("Aceptar") {
                print("Dismiss Alert")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
