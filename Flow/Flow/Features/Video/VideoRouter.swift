//
//  VideoRouter.swift
//  Flow
//
//  Created by Pedro Sousa on 29/08/23.
//

import SwiftUI

class VideoRouter: Router {
    let id: UUID = UUID()

    @ObservedObject var coordinator: DashboardCoordinator

    required init(coordinator: DashboardCoordinator) {
        self.coordinator = coordinator
    }

    func build() -> some View {
        VideoView(router: self)
    }
}

extension VideoRouter {
    enum Coordinates: String {
        case channel
        case report
    }
}

extension VideoRouter {
    static func == (lhs: VideoRouter, rhs: VideoRouter) -> Bool {
        lhs.id == rhs.id
    }
}
