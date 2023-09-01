//
//  VideoRouter.swift
//  Flow
//
//  Created by Pedro Sousa on 01/09/23.
//

import SwiftUI

class VideRouter: Router {
    var parent: DashboardCoordinator?

    required init(parent: DashboardCoordinator? = nil) {
        self.parent = parent
    }

    @ViewBuilder func build() -> some View {
        VideoView(router: self)
    }
}

extension VideRouter {
    static func == (lhs: VideRouter, rhs: VideRouter) -> Bool {
        lhs.id == rhs.id
    }
}
