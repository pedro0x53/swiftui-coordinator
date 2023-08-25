//
//  Coordinator.swift
//  Flow
//
//  Created by Pedro Sousa on 24/08/23.
//

import Foundation

protocol Coordinator {
    func push(_ flow: any Hashable)
    func pop()
    func popToRoot()
    func pop(to flow: any Hashable)
}

extension Hashable where Self: Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
