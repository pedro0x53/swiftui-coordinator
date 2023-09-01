//
//  LoginView.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var router: LoginRouter

    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Button("Push to forget Password") {
                    router.push(LoginRouter.Coordinates.forgetPassword())
                }

                Button("Go to Dashboard") {
                    router.dismiss()
                }
            }
            .navigationTitle("Login")
            .navigationDestination(for: LoginRouter.Coordinates.self) { coordinate in
                switch coordinate {
                case .forgetPassword(email: let email):
                    ForgetPasswordView(email: email)
                }
            }
        }
    }
}

struct LoginViewPreview: PreviewProvider {
    static var previews: some View {
        LoginRouter().build()
    }
}
