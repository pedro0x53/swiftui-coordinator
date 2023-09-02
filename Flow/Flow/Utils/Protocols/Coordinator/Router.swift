//
//  Router.swift
//  Flow
//
//  Created by Pedro Sousa on 31/08/23.
//

import Foundation

protocol Router: Coordinator, FlowBuilder {
    associatedtype Parent: StackCoordinator
    var parent: Parent? { get set }
    init(parent: Parent?)
}

extension Router {
    func push<Flow: Hashable>(_ flow: Flow) {
        self.parent?.push(flow)
    }

    func pop(_ k: Int = 1) {
        self.parent?.pop(k)
    }

    func popToRoot() {
        self.parent?.popToRoot()
    }

    func pop<Flow: Hashable>(to flow: Flow) {
        self.parent?.pop(to: flow)
    }
}
