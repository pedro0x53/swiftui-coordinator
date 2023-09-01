//
//  Presenter.swift
//  Flow
//
//  Created by Pedro Sousa on 24/08/23.
//

import SwiftUI

protocol Presenter: AnyObject, Identifiable, Hashable, ObservableObject {
    associatedtype Sheets

    func present(sheet: Sheets)
    func dismiss(sheet: Sheets)
}

extension Presenter {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

// MARK: Presented
protocol Presented: AnyObject {
    var onDismiss: (() -> Void)? { get set }

    init(onDismiss: (() -> Void)?)

    func dismiss()
    func onDismiss(perform: @escaping () -> Void) -> Self
}

extension Presented {
    @discardableResult func onDismiss(perform: @escaping () -> Void) -> Self {
        self.onDismiss = perform
        return self
    }
}
