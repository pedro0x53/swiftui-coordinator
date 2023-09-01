//
//  Coordinator.swift
//  Flow
//
//  Created by Pedro Sousa on 24/08/23.
//

import SwiftUI

protocol StackCoordinator: Coordinator, FlowBuilder {
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


extension Hashable where Self: Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

public extension RawRepresentable where Self: Identifiable, RawValue == String {
    var id: String { self.rawValue }
}
