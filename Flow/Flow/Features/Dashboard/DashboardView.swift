//
//  DashboardView.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var coordinator: DashboardCoordinator

    init(coordinator: DashboardCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                Button("Push to Video") {
                    coordinator.push(DashboardCoordinates.video)
                }

                Button("Present Project Editor") {
                    coordinator.present(sheet: .projectEditor())
                }

                Button("Log Out") {
                    coordinator.logOut()
                }
            }
            .navigationDestination(for: DashboardCoordinates.self) { coordinate in
                switch coordinate {
                case .video:
                    coordinator.videoRouter.build()
                }
            }
            .sheet(
                isPresented: $coordinator.isPresentingProjectEditor,
                onDismiss: {
                    self.coordinator.dismiss(sheet: .projectEditor())
                },
                content: {
                    coordinator.projectEditorCoordinator.build()
                }
            )
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(coordinator: .init(appCoordinator: .init()))
    }
}
