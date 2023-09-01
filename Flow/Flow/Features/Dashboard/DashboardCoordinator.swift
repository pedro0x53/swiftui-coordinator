//
//  DashboardRouter.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

enum DashboardCoordinates: Hashable {
    case video
}

enum DashboardSheets: Hashable {
    case projectEditor(projectName: String? = nil)
}

class DashboardCoordinator: StackCoordinator {
    let id: UUID = UUID()

    var appCoordinator: AppCoordinator
    var projectEditorCoordinator: ProjectEditorStackCoordinator
    var videoRouter: VideRouter

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

        let projectEditor = ProjectEditorStackCoordinator()
        self.projectEditorCoordinator = projectEditor

        let videoRouter = VideRouter()
        self.videoRouter = videoRouter


        self.projectEditorCoordinator.onDismiss {
            self.dismiss(sheet: .projectEditor())
        }

        self.videoRouter.parent = self
    }

    @ViewBuilder func build() -> some View {
        DashboardView(coordinator: self)
    }

    func logOut() {
        self.popToRoot()
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
