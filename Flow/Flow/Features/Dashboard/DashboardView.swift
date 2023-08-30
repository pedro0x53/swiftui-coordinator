//
//  DashboardView.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var router: DashboardCoordinator

    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Button("Push to Video") {
                    router.push(VideoRouter(coordinator: self.router))
                }

                Button("Present Project Editor") {
                    router.present(sheet: .projectEditor())
                }

                Button("Log Out") {
                    router.logOut()
                }
            }
            .navigationDestination(for: VideoRouter.self) { router in
                router.build()
            }
            .sheet(
                isPresented: $router.isPresentingProjectEditor,
                onDismiss: {
                    self.router.dismiss(sheet: .projectEditor())
                },
                content: {
                    ProjectEditorStackCoordinator(dismiss: {
                        self.router.dismiss(sheet: .projectEditor())
                    }).build()
                }
            )
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(router: .init(appCoordinator: AppCoordinator()))
    }
}
