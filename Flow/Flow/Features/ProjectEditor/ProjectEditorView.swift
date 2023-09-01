//
//  ProjectEditorView.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

struct ProjectEditorView: View {
    @ObservedObject var router: ProjectEditorStackCoordinator

    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Button("Go to Second Step") {
                    router.push(ProjectEditorStackCoordinator.Coordinates.additional)
                }

                Button("Dismiss") {
                    router.dismiss()
                }
            }
            .navigationTitle("FirstStep")
            .navigationDestination(for: ProjectEditorStackCoordinator.Coordinates.self) { _ in
                ProjectEditorAdditionalView(router: self.router)
            }
        }
    }
}

struct ProjectEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectEditorView(router: .init())
    }
}
