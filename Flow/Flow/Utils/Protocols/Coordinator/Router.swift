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

    func pop() {
        self.parent?.pop()
    }

    func popToRoot() {
        self.parent?.popToRoot()
    }
}
