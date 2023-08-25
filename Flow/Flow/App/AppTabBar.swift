//
//  AppTabBar.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

struct AppTabBar: View {
    @ObservedObject var tabCoordinator: AppTabBarCoordinator

//    @ObservedObject var Stack

    var body: some View {
        TabView(selection: $tabCoordinator.selectedTab) {
            DashboardRoute(coordinator: tabCoordinator.coordinator)
                .build()
                .tabItem {
                    Text("Dashboard")
                }

            CalendarView()
                .tabItem {
                    Text("Calendar")
                }

            SettingsView()
                .tabItem {
                    Text("Settings")
                }
        }
    }
}

struct AppTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBar(
            tabCoordinator: AppTabBarCoordinator(
                                coordinator: AppCoordinator(),
                                selectedTab: .dashboard)
        )
    }
}
