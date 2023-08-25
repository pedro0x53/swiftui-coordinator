//
//  AppCoordinator.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

class AppCoordinator: StackCoordinator {
    @ObservedObject var path: NavigationPath
    var isLoggedIn: Bool

    required init(path: NavigationPath) {
        fatalError("Use the conveniece initializer init(path:isLoggedIn:)")
    }

    init(path: NavigationPath = [], isLoggedIn: Bool = false) {
        self.path = NavigationPath(path: path)
        self.isLoggedIn = isLoggedIn
    }
}

extension AppCoordinator {
    @ViewBuilder func build() -> some View {
        LoginRoute(coordinator: self, isLoggedIn: isLoggedIn).build()
    }
}

extension AppCoordinator {
    static func == (lhs: AppCoordinator, rhs: AppCoordinator) -> Bool {
        lhs.id == rhs.id
    }
}

extension AppCoordinator {
    enum Tabs: String, Hashable {
        case dashboard
        case calendar
        case settings
    }

    enum Coordinates: String, Hashable {
        case tabView
    }
}
