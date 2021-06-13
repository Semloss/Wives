//
//  WivesApp.swift
//  Wives
//
//  Created by 张松 on 2021/6/6.
//

import SwiftUI

@main
struct WivesApp: App {
    // 这个主要是针对主页面
    @StateObject private var appState = AppState.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .frame(minWidth: 1000, idealWidth: 1200, maxWidth: .infinity, minHeight: 600, idealHeight: 800, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        Settings{
            SettingView()
        }
    }
}
