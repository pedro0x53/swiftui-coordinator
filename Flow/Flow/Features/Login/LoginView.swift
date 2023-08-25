//
//  LoginView.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

struct LoginView: View {
    var router: LoginRoute

    var body: some View {
        Button("Go to Dashboard") {
            router.push(
                LoginRoute.Coordinates.tabView(selectedTab: .dashboard)
            )
        }
        .navigationTitle("Login")
    }
}

struct LoginViewPreview: PreviewProvider {
    static var previews: some View {
        LoginView(router: .init(coordinator: AppCoordinator()))
    }
}
