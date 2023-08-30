//
//  VideoView.swift
//  Flow
//
//  Created by Pedro Sousa on 29/08/23.
//

import SwiftUI

struct VideoView: View {
    @ObservedObject var router: VideoRouter

    var body: some View {
        VStack {
            Button("Push to Channel") {
                router.push(VideoRouter.Coordinates.channel)
            }

            Button("Push to Report") {
                router.push(VideoRouter.Coordinates.report)
            }

            Button("Back to Dashboard") {
                router.popToRoot()
            }
        }
        .navigationDestination(for: VideoRouter.Coordinates.self) { coordinate in
            switch coordinate {
            case .channel:
                Text("Channel")
            case .report:
                Text("Report")
            }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(router: .init(coordinator: DashboardCoordinator(appCoordinator: .init())))
    }
}
