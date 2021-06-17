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
    // 这个主要是针对主页面
    @StateObject private var appState = AppState.shared
    var body: some Scene {
//        WindowGroup(Text("ni hao")) {
//            ContentView()
//                .environmentObject(appState)
//                .frame(minWidth: 1000, idealWidth: 1200, maxWidth: .infinity, minHeight: 600, idealHeight: 800, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//        }
        Settings{
            SettingView()
        }
    }
}

final class AppDelegate: NSObject, NSApplicationDelegate {
    // This is only run when the app is started when it's already running.
    var window: NSWindow!
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = ContentView()
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 1200, height: 600),
            styleMask: [.titled, .borderless, .closable, .resizable, .miniaturizable],
            backing: .buffered, defer: false)

        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }
}
