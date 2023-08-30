//
//  Coordinator.swift
//  Flow
//
//  Created by Pedro Sousa on 24/08/23.
//

import Foundation

protocol Coordinator: Identifiable, Hashable {
    func push<Flow: Hashable>(_ flow: Flow)
    func pop()
    func popToRoot()
}

extension Hashable where Self: Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
