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
    var dismiss: (() -> Void)?

    required init(path: NavigationPath) {
        self.dismiss = nil
        self.path = path
    }

    required init(dismiss: (() -> Void)? = nil) {
        self.dismiss = dismiss
        self.path = NavigationPath()
    }

    init(path: NavigationPath = NavigationPath(),
         dismiss: (() -> Void)? = nil) {
        self.dismiss = dismiss
        self.path = path
    }

    @ViewBuilder func build() -> some View {
        ProjectEditorView(router: self)
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
