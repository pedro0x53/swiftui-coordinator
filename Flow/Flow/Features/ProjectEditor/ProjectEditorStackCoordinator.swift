//
//  ProjectEditorStackCoordinator.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

class ProjectEditorStackCoordinator: Presented, StackCoordinator {
    let id: UUID = UUID()

    @Published var path: NavigationPath
    var onDismiss: (() -> Void)?

    required init(path: NavigationPath) {
        self.onDismiss = nil
        self.path = path
    }

    required init(onDismiss: (() -> Void)? = nil) {
        self.onDismiss = onDismiss
        self.path = NavigationPath()
    }

    init(path: NavigationPath = NavigationPath(),
         onDismiss: (() -> Void)? = nil) {
        self.onDismiss = onDismiss
        self.path = path
    }

    @ViewBuilder func build() -> some View {
        ProjectEditorView(router: self)
    }

    func dismiss() {
        self.onDismiss?()
    }
}

extension ProjectEditorStackCoordinator {
    enum Coordinates: String, Hashable {
        case additional

        func hash(into hasher: inout Hasher) {
            hasher.combine(self.rawValue)
        }
    }
}

extension ProjectEditorStackCoordinator {
    static func == (lhs: ProjectEditorStackCoordinator, rhs: ProjectEditorStackCoordinator) -> Bool {
        lhs.id == rhs.id
    }
}
