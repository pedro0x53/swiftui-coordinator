//
//  DashboardRoute.swift
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

class DashboardRoute: Router, StackCoordinator {
    var path: NavigationPath
    var coordinator: any StackCoordinator

    @ObservedObject var isPresentingProjectEditor = WrappedPublisher(false)

    required init(path: NavigationPath) {
        fatalError("Use the conveniece initializer init(parent:path:)")
    }

    required init(coordinator: any StackCoordinator) {
        fatalError("Use the conveniece initializer init(parent:path:)")
    }

    init(parent: any StackCoordinator, path: NavigationPath) {
        self.coordinator = parent
        self.path = NavigationPath(path: path)
    }

    func build() -> some View {
        DashboardView(router: self)
            .sheet(
                isPresented: $isPresentingProjectEditor.value,
                onDismiss: dismissProjectEditor,
                content: {
                    ProjectEditorStackCoordinator(onDismiss: self.dismissProjectEditor).build()
                }
            )
    }

    func dismissProjectEditor() {
        self.isPresentingProjectEditor.value = false
    }

    func popToLogIn() {
        self.path.clear()
        self.coordinator.popToRoot()
    }
}

extension DashboardRoute: Presenter {
    func present(sheet: DashboardSheets) -> some View {
        ProjectEditorView()
    }

    func dismiss(sheet: DashboardSheets) {
        self.isPresentingProjectEditor.value = false
    }
}

extension DashboardRoute {
    static func == (lhs: DashboardRoute, rhs: DashboardRoute) -> Bool {
        lhs.id == rhs.id
    }
}
