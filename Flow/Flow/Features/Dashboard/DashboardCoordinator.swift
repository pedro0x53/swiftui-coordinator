//
//  DashboardRouter.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

enum DashboardSheets: Hashable {
    case projectEditor
}

class DashboardCoordinator: StackCoordinator {
    let id: UUID = UUID()

    weak var appCoordinator: AppCoordinator?
    var projectEditorCoordinator: ProjectCoordinator
    var videoRouter: VideoRouter

    @Published var isPresentingProjectEditor: Bool = false
    @Published var path: NavigationPath = NavigationPath()
    var breadcrumbs: [any Hashable] = []

    required init(path: [any Hashable]) {
        fatalError("Use the conveniece initializer init(appCoordinator:path:isPresentingProjectEditor:)")
    }

    init(appCoordinator: AppCoordinator? = nil,
         path: [any Hashable] = [],
         isPresentingProjectEditor: Bool = false) {
        self.appCoordinator = appCoordinator
        self.isPresentingProjectEditor = isPresentingProjectEditor
        self.breadcrumbs = path

        let projectEditor = ProjectCoordinator()
        self.projectEditorCoordinator = projectEditor

        let videoRouter = VideoRouter()
        self.videoRouter = videoRouter

        self.videoRouter.parent = self

        self.projectEditorCoordinator.onDismiss {
            self.dismiss(sheet: .projectEditor)
        }

        path.forEach { self.path.append($0) }
    }

    @ViewBuilder func build() -> some View {
        DashboardView(coordinator: self)
    }

    func logOut() {
        self.popToRoot()
        appCoordinator?.logOut()
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
