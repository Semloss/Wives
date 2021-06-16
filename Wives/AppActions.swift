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
    static func quit() {
        NSApp.terminate(nil)
    }
    
    func loadImageFromLibrary() {
        // 检查图片文件夹是否存在
        checkImageLibraryFloder()
        // 遍历文件夹加载图片
        let iterator = FileManager.default.enumerator(atPath: self.libraryImageSavePath!.path)
        while let elemet = iterator?.nextObject() as? String {
            // 从本地加载图片到appstate中
            self.libraryImageList.append(NSImage(byReferencing: self.libraryImageSavePath!.appendingPathComponent(elemet)))
//            NSLog(String(self.libraryImageList.count))
        }
        NSLog("load")
    }
    
    // 检查是否有存放图片的文件夹，没有则创建
    func checkImageLibraryFloder() {
        self.getLibraryImageSavePath()
        if(!FileManager.default.fileExists(atPath: self.libraryImageSavePath!.path)) {
            do {
                try FileManager.default.createDirectory(at: self.libraryImageSavePath!, withIntermediateDirectories: true, attributes: nil)
            } catch  {
                fatalError(because: .createfolderfailed)
            }
        }
    }
    
    func getLibraryImageSavePath() {
        guard self.libraryImageSavePath != nil else {
            self.libraryImageSavePath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Downloads", isDirectory: true)
                .appendingPathComponent("WivesImage", isDirectory: true)
            return
        }
    }
    
    func initMainStatusItem() {
        mainStatusItem.isVisible = true
        mainStatusItem.behavior = [.removalAllowed, .terminationOnRemoval]
        mainStatusItem.menu = mainMenu
        mainStatusItem.button!.image = mainStatusIcon
    }
    
    // 加载menu， 不过加载的过程中所有的东西都是静态的， 然后事件响应可以通过publisher
    func showMenu() {
        //mainMenu.removeAllItems()
        mainMenu.addDisabled("Deactivated While on Battery")
        mainMenu.addSeparator()
        mainMenu.addSettingsItem()
        mainMenu.addQuitItem()
    }
    
    static func showSettingView() {
        DispatchQueue.main.async {
            NSApp.sendAction(Selector(("showPreferencesWindow:")), to: nil, from: nil)
        }
    }
    
}


// 这里所有的代码都是在处理浏览窗口的事件，非常典型
/*
extension AppState {
    func setUpURLCommands() {
        SSPublishers.appOpenURL
            .sink { [self] in
                handleURLCommands($0)
            }
            .store(in: &cancellables)
    }

    // 处理在网页浏览窗口中的一些事件
    private func handleURLCommands(_ urlComponents: URLComponents) {
        guard urlComponents.scheme == "plash" else {
            return
        }

        let command = urlComponents.path
        let parameters = urlComponents.queryDictionary

        func showMessage(_ message: String) {
            NSApp.activate(ignoringOtherApps: true)
            NSAlert.showModal(title: message)
        }

        switch command {
        case "add":
            guard
                let urlString = parameters["url"]?.trimmed,
                let url = URL(string: urlString),
                url.isValid
            else {
                showMessage("Invalid URL for the “add” command.")
                return
            }

            WebsitesController.shared.add(url, title: parameters["title"]?.trimmed.nilIfEmpty)
        case "reload":
            reloadWebsite()
        case "next":
            WebsitesController.shared.makeNextCurrent()
        case "previous":
            WebsitesController.shared.makePreviousCurrent()
        case "toggle-browsing-mode":
            Defaults[.isBrowsingMode].toggle()
        default:
            showMessage("The command “\(command)” is not supported.")
        }
    }
}
 */

