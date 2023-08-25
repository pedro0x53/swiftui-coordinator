//
//  BindingProxy.swift
//  Flow
//
//  Created by Pedro Sousa on 24/08/23.
//

import SwiftUI

class WrappedPublisher<T>: ObservableObject {
    @Published var value: T

    init(_ value: T) { self.value = value }
}
