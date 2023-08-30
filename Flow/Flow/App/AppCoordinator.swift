//
//  AppCoordinator.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

class AppCoordinator: TabCoordinator, Presenter {
    let id: UUID = UUID()

    @Published var selectedTab: AppCoordinator.Tabs
    @Published var shouldLogIn: Bool

    required init(selectedTab: AppCoordinator.Tabs) {
        self.shouldLogIn = true
        self.selectedTab = selectedTab
    }

    init(isLoggedIn: Bool = false,
         selectedTab: AppCoordinator.Tabs = .dashboard) {
        self.shouldLogIn = !isLoggedIn
        self.selectedTab = selectedTab
    }

    func select(tab: AppCoordinator.Tabs) {
        self.selectedTab = tab
    }

    func logOut() {
        self.shouldLogIn = true
    }
}

extension AppCoordinator {
    @ViewBuilder func build() -> some View {
        AppTabBar(appCoordinator: self)
    }
}

extension AppCoordinator {
    enum Sheets: String {
        case login
    }

    func present(sheet: AppCoordinator.Sheets) {
        self.shouldLogIn = true
    }

    func dismiss(sheet: AppCoordinator.Sheets) {
        self.shouldLogIn = false
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
}
