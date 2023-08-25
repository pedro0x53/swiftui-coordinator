//
//  AppTabBarCoordinator.swift
//  Flow
//
//  Created by Pedro Sousa on 24/08/23.
//

import SwiftUI

class AppTabBarCoordinator: Router, TabCoordinator {
    var coordinator: any StackCoordinator
    @Published var selectedTab: AppTabBarCoordinator.Tabs
    
    required init(coordinator: any StackCoordinator) {
        fatalError("Use the conveniece initializer init(path:isLoggedIn:)")
    }
    
    required init(selectedTab: AppTabBarCoordinator.Tabs) {
        fatalError("Use the conveniece initializer init(path:isLoggedIn:)")
    }

    init(coordinator: any StackCoordinator, selectedTab: AppTabBarCoordinator.Tabs) {
        self.coordinator = coordinator
        self.selectedTab = selectedTab
    }
    
    func build() -> some View {
        AppTabBar(tabCoordinator: self)
    }
}

extension AppTabBarCoordinator {
    enum Tabs: String, Hashable {
        case dashboard
        case calendar
        case settings
    }
}
