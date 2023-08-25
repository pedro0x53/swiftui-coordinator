//
//  FlowApp.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

@main
struct FlowApp: App {
    @StateObject var appCoordinator: AppCoordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path.navigationPath) {
                appCoordinator.build()
            }
        }
    }
}
