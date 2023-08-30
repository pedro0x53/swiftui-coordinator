//
//  DashboardRouter.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

enum DashboardCoordinates: Hashable {
    case project(projectName: String)
}

enum DashboardSheets: Hashable {
    case projectEditor(projectName: String? = nil)
}

class DashboardCoordinator: StackCoordinator {
    let id: UUID = UUID()

    @ObservedObject var appCoordinator: AppCoordinator

    @Published var path: NavigationPath
    @Published var isPresentingProjectEditor: Bool = false

    required init(path: NavigationPath) {
        fatalError("Use the conveniece initializer init(appCoordinator:path:isPresentingProjectEditor:)")
    }

    init(appCoordinator: AppCoordinator,
         path: NavigationPath = NavigationPath(),
         isPresentingProjectEditor: Bool = false) {
        self.appCoordinator = appCoordinator
        self.path = path
        self.isPresentingProjectEditor = isPresentingProjectEditor
    }

    func build() -> some View {
        DashboardView(router: self)
    }

    func logOut() {
        self.path = NavigationPath()
        appCoordinator.logOut()
    }
}

extension DashboardCoordinator: Presenter {
    func present(sheet: DashboardSheets) {
        self.isPresentingProjectEditor = true
    }

    func dismiss(sheet: DashboardSheets) {
        self.isPresentingProjectEditor = false
    }
}

extension DashboardCoordinator {
    static func == (lhs: DashboardCoordinator, rhs: DashboardCoordinator) -> Bool {
        lhs.id == rhs.id
    }
}
