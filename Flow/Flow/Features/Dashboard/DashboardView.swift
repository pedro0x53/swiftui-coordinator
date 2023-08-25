//
//  DashboardView.swift
//  Flow
//
//  Created by Pedro Sousa on 22/08/23.
//

import SwiftUI

struct DashboardView: View {
    var router: DashboardRoute

    var body: some View {
        Button("Go to Project Editor") {
            router.isPresentingProjectEditor.value = true
        }
        .navigationTitle("Dashboard")
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(router: .init(coordinator: AppCoordinator()))
    }
}
