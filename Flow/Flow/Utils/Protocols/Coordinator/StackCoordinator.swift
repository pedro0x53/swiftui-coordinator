//
//  StackCoordinator.swift
//  Flow
//
//  Created by Pedro Sousa on 23/08/23.
//

import Foundation

protocol StackCoordinator: FlowBuilder {
    var path: Path { get set }
    init(path: HashList)
}

extension StackCoordinator {
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
