//
//  LoginRouter.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

class LoginRouter: Presented, StackCoordinator {
    let id: UUID = UUID()

    @Published var path: NavigationPath
    var dismiss: (() -> Void)?
    
    required init(path: NavigationPath) {
        self.path = path
        self.dismiss = nil
    }

    required init(dismiss: (() -> Void)? = nil) {
        self.path = NavigationPath()
        self.dismiss = dismiss
    }

    init(path: NavigationPath = NavigationPath(),
         dismiss: (() -> Void)? = nil) {
        self.path = path
        self.dismiss = dismiss
    }

    func build() -> some View {
        LoginView(route: self)
    }
}

extension LoginRouter {
    enum Coordinates: Hashable {
        case forgetPassword(email: String? = nil)

        func hash(into hasher: inout Hasher) {
            switch self {
            case .forgetPassword(let email):
                hasher.combine(email)
            }
        }
    }
}

extension LoginRouter {
    static func == (lhs: LoginRouter, rhs: LoginRouter) -> Bool {
        lhs.id == rhs.id
    }
}
