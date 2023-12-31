//
//  FlowBuilder.swift
//  Flow
//
//  Created by Pedro Sousa on 24/08/23.
//

import SwiftUI

protocol FlowBuilder {
    associatedtype Build: View
    @ViewBuilder func build() -> Build
}
