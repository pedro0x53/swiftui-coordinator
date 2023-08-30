//
//  FlowBuilder.swift
//  Flow
//
//  Created by Pedro Sousa on 24/08/23.
//

import SwiftUI

protocol FlowBuilder: AnyObject, ObservableObject, Coordinator {
    associatedtype Build: View
    @ViewBuilder func build() -> Build
}
