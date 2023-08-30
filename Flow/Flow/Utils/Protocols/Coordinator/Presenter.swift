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

protocol Presented {
    var dismiss: (() -> Void)? { get set }

    init(dismiss: (() -> Void)?)
}