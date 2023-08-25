//
//  Path.swift
//  Flow
//
//  Created by Pedro Sousa on 23/08/23.
//

import SwiftUI

typealias HashList = [any Hashable]

class Path: ObservableObject {
    @Published var navigationPath: NavigationPath
    @Published var path: [any Hashable] = []

    init(path hashes: HashList = []) {
        self.path = hashes
        var navPath = NavigationPath()

        hashes.forEach { hash in
            navPath.append(hash)
        }

        self.navigationPath = navPath
    }

    func push(_ hash: any Hashable) {
        path.append(hash)
        navigationPath.append(hash)
    }

    func push(_ hashes: HashList) {
        hashes.forEach { hash in
            self.push(hash)
        }
    }

    func pop() {
        path.removeLast()
    }

    func pop(to hash: any Hashable) {
        guard let hashIndex = (path.firstIndex { $0.hashValue == hash.hashValue })
        else { return }

        let amountToRemove = path.count - hashIndex
        path.removeLast(amountToRemove)
        navigationPath.removeLast(amountToRemove)
    }

    func clear() {
        path.removeAll()
        navigationPath = NavigationPath()
    }
}

extension Path: Hashable {
    func hash(into hasher: inout Hasher) {
        self.path.forEach { hash in
            hasher.combine(hash)
        }
    }

    static func == (lhs: Path, rhs: Path) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
