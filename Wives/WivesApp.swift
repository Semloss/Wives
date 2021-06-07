//
//  WivesApp.swift
//  Wives
//
//  Created by 张松 on 2021/6/6.
//

import SwiftUI

@main
struct WivesApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    @StateObject private var appState = AppState.shared
    var body: some Scene {
        WindowGroup {
            return ContentView()
        }
    }
}
