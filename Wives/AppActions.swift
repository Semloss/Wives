//
//  AppActions.swift
//  Wives
//
//  Created by 张松 on 2021/6/6.
//

import Foundation
import AppKit
import Defaults

extension AppState {
    // 主要放一些行为   
    func quit() {
        NSApp.terminate(nil)
    }
    
    func loadImageFromLibrary() {
        // 加载图片
    }
    
    func getLibraryImageSavePath() {
        guard self.libraryImageSavePath != nil else {
            self.libraryImageSavePath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Library", isDirectory: true)
            return
        }
    }
    
    func initMainStatusItem() {
        mainStatusItem.isVisible = true
        mainStatusItem.behavior = [.removalAllowed, .terminationOnRemoval]
        mainStatusItem.menu = mainMenu
        mainStatusItem.button?.image = mainStatusIcon
    }
    
    // 加载menu， 不过加载的过程中所有的东西都是静态的， 然后事件响应可以通过publisher
//    func updateMenu() {
//        menu.removeAllItems()
//        NSLog("每次都要重新加载menu")
//
//        if isEnabled {
//            addWebsiteItems()
//        } else {
//            menu.addDisabled("Deactivated While on Battery")
//        }
//
//        menu.addSeparator()
//
//        menu.addSettingsItem()
//
//        menu.addItem("More")
//            .withSubmenu(createMoreMenu())
//
//        menu.addSeparator()
//
//        menu.addQuitItem()
//    }
    
    
}
