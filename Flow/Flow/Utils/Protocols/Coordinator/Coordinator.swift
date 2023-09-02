//
//  Coordinator.swift
//  Flow
//
//  Created by Pedro Sousa on 01/09/23.
//

import Foundation

protocol Coordinator: Identifiable, Hashable, AnyObject, ObservableObject {
    func push<Flow: Hashable>(_ flow: Flow)
    func pop(_ k: Int)
    func popToRoot()
    func pop<Flow: Hashable>(to flow: Flow)
}
