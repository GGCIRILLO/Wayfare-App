//
//  App_name_prototypeApp.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 28/02/23.
//

import SwiftUI

@main
struct App_name_prototypeApp: App {
    var body: some Scene {
        WindowGroup {
                OnboardingView()
                    .preferredColorScheme(.dark)
                    .environmentObject(Favorites())
        }
    }
}
