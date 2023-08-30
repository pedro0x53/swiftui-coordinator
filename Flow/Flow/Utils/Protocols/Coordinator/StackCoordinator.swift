//
//  StackCoordinator.swift
//  Flow
//
//  Created by Pedro Sousa on 23/08/23.
//

import SwiftUI

protocol StackCoordinator: FlowBuilder {
    var path: NavigationPath { get set }
    init(path: NavigationPath)
}

extension StackCoordinator {
    func push<Flow: Hashable>(_ flow: Flow) {
        self.path.append(flow)
    }

    func pop() {
        self.path.removeLast()
    }

    func popToRoot() {
        path = NavigationPath()
    }
}
