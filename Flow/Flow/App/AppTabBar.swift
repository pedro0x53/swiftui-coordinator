//
//  AppTabBar.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

struct AppTabBar: View {
    @ObservedObject var appCoordinator: AppCoordinator

    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

    var body: some View {
        TabView(selection: $appCoordinator.selectedTab) {
            DashboardCoordinator(appCoordinator: appCoordinator)
                .build()
                .navigationTitle("Dashboard")
                .tabItem {
                    Text("Dashboard")
                }
                .tag(AppCoordinator.Tabs.dashboard)

            CalendarView()
                .navigationTitle("Calendar")
                .tabItem {
                    Text("Calendar")
                }
                .tag(AppCoordinator.Tabs.calendar)

            SettingsView()
                .navigationTitle("Settings")
                .tabItem {
                    Text("Settings")
                }
                .tag(AppCoordinator.Tabs.settings)
        }
        .fullScreenCover(isPresented: $appCoordinator.shouldLogIn) {
            LoginRouter {
                self.appCoordinator.dismiss(sheet: .login)
            }
            .build()
        }
    }
}

struct AppTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AppCoordinator(isLoggedIn: false)
            .build()
    }
}
