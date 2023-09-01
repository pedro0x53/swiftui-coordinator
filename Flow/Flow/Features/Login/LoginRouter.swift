//
//  LoginRouter.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

class LoginRouter: StackCoordinator, Presented {
    let id: UUID = UUID()

    @Published var path: NavigationPath
    var onDismiss: (() -> Void)?
    
    required init(path: NavigationPath) {
        self.path = path
        self.onDismiss = nil
    }

    required init(onDismiss: (() -> Void)? = nil) {
        self.path = NavigationPath()
        self.onDismiss = onDismiss
    }

    init(path: NavigationPath = NavigationPath(),
         onDismiss: (() -> Void)? = nil) {
        self.path = path
        self.onDismiss = onDismiss
    }

    func build() -> some View {
        LoginView(router: self)
    }

    func dismiss() {
        self.onDismiss?()
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
