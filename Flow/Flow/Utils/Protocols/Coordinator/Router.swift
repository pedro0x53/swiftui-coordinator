//
//  Router.swift
//  Flow
//
//  Created by Pedro Sousa on 24/08/23.
//

import SwiftUI

protocol Router: FlowBuilder {
    associatedtype Parent: StackCoordinator

    var coordinator: Parent { get }
    init(coordinator: Parent)
}

extension Router {
    func push<Flow: Hashable>(_ flow: Flow) {
        self.coordinator.push(flow)
    }

    func pop() {
        self.coordinator.pop()
    }

    func popToRoot() {
        self.coordinator.popToRoot()
    }
}

//extension Router where Self: StackCoordinator {
//    func push<Flow: Hashable>(_ flow: Flow) {
//        self.path.append(flow)
//    }
//
//    func pop() {
//        self.path.removeLast()
//    }
//
//    func popToRoot() {
//        path = NavigationPath()
//    }
//}
