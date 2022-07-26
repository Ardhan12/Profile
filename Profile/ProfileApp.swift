//
//  ProfileApp.swift
//  Profile
//
//  Created by Arief Ramadhan on 20/07/22.
//

import SwiftUI

@main
struct ProfileApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ProfileViewModel())
        }
    }
}
