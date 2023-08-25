//
//  LoginRoute.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

class LoginRoute: Router {
    var coordinator: any StackCoordinator
    var isLoggedIn: Bool
    
    required init(coordinator: any StackCoordinator) {
        fatalError("Use the conveniece initializer init(coordinator:isLoggedIn:)")
    }

    init(coordinator: any StackCoordinator, isLoggedIn: Bool) {
        self.coordinator = coordinator
        self.isLoggedIn = isLoggedIn
    }
    
    func build() -> some View {
        LoginView(router: self)
            .navigationDestination(for: LoginRoute.Coordinates.self) { coordinate in
                // MARK: Avoid use 'default' on this switch, so when a new Coordinate is added, the compiler will trigger an error here and the developers will have to make sure that they are covering properly the cases.
                switch coordinate {
                case .forgetPassword(let email):
                    ForgetPasswordView(email: email)
                case .tabView(selectedTab: let selectedTab):
                    AppTabBarCoordinator(coordinator: self.coordinator, selectedTab: selectedTab).build()
                }
            }
    }
}

extension LoginRoute {
    enum Coordinates: Hashable {
        case forgetPassword(email: String? = nil)
        case tabView(selectedTab: AppTabBarCoordinator.Tabs)

        func hash(into hasher: inout Hasher) {
            switch self {
            case .forgetPassword(let email):
                hasher.combine(email)
            case .tabView(let tab):
                hasher.combine(tab.rawValue)
            }
        }
    }
}

extension LoginRoute {
    static func == (lhs: LoginRoute, rhs: LoginRoute) -> Bool {
        lhs.id == rhs.id
    }
}
