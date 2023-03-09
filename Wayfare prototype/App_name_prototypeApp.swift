//
//  App_name_prototypeApp.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 28/02/23.
//

import SwiftUI

@main
struct App_name_prototypeApp: App {
    let aaa = Act()
    var body: some Scene {
        WindowGroup {
                OnboardingView()
                    .preferredColorScheme(.dark)
                    .environmentObject(aaa)
                    .environmentObject(Favorites())
        }
    }
}
