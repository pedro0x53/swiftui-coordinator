//
//  Router.swift
//  Flow
//
//  Created by Pedro Sousa on 24/08/23.
//

import Foundation

protocol Router: FlowBuilder {
    var coordinator: any StackCoordinator { get }
    init(coordinator: any StackCoordinator)
}

extension Router {
    func push(_ flow: any Hashable) {
        self.coordinator.push(flow)
    }

    func pop() {
        self.coordinator.pop()
    }

    func popToRoot() {
        self.coordinator.popToRoot()
    }

    func pop(to flow: any Hashable) {
        self.coordinator.pop(to: flow)
    }
}

extension Router where Self: StackCoordinator {
    func push(_ hash: any Hashable) {
        self.path.push(hash)
    }

    func pop() {
        self.path.pop()
    }

    func pop(to hash: any Hashable) {
        path.pop(to: hash)
    }

    func popToRoot() {
        path.clear()
    }
}
