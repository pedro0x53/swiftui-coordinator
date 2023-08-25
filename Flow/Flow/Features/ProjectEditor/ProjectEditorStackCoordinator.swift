//
//  ProjectEditorStackCoordinator.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

enum ProjectEditorCoordinates: String, Hashable {
    case additional

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

class ProjectEditorStackCoordinator: Presented, StackCoordinator {
    var path: NavigationPath
    var dismiss: (() -> Void)?

    required init(path: NavigationPath = []) {
        fatalError("Use the conveniece initializer init(presenter:path:)")
    }

    init(path: NavigationPath = [], onDismiss: (() -> Void)? = nil) {
        self.dismiss = onDismiss
        self.path = NavigationPath(path: path)
    }

    @ViewBuilder func build() -> some View {
        ProjectEditorView()
            .navigationDestination(for: ProjectEditorCoordinates.self) { _ in
                ProjectEditorAdditionalView()
            }
    }
}

extension ProjectEditorStackCoordinator {
    static func == (lhs: ProjectEditorStackCoordinator, rhs: ProjectEditorStackCoordinator) -> Bool {
        lhs.id == rhs.id
    }
}
