//
//  AppState.swift
//  Wives
//
//  Created by 张松 on 2021/6/6.
//

import Foundation
import AppKit
import Defaults

class AppState: ObservableObject {
    let shared = AppState()
    
    // 图片资源list
    var libraryImageList : [NSImage] = []
    // 左边栏的选择状态，以及展示的wording
    
    var mainStatusIcon = NSImage(named: "MenuBarIcon")
    
    var libraryImageSavePath = Defaults[.libraryimagesavepath]
    
    // app相关数据
    let id = Bundle.main.bundleIdentifier!
    let name = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as! String
    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let build = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    let url = Bundle.main.bundleURL
    
    // 主要表示一些状态
    
    // 是否第一次加载，从defaults中获取，获取之后就不能修改
    let isFirstLaunch: Bool = {
        return Defaults[.isfirstlaunch]
    }()
    
    let mainMenu = SSMenu()
    
//    private(set) lazy var statusItem = with(NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)) {
//        $0.isVisible = true
//        $0.behavior = [.removalAllowed, .terminationOnRemoval]
//        $0.menu = menu
//        $0.button?.image = Constants.menuBarIcon
//    }
//
//    private(set) lazy var statusItemButton = statusItem.button!
    
    private(set) lazy var mainStatusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    

    
//    func getLibraryImageSavePath()
//    {
//        guard self.libraryImageSavePath != nil else {
//            self.libraryImageSavePath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Library", isDirectory: true)
//            return
//        }
//    }
    
    // init
    init() {
        // 初始化一些值
        //_ = statusItemButton
    }
    
    private func load() {
        DispatchQueue.main.async {
            if self.isFirstLaunch {
                self.getLibraryImageSavePath()
            }
            self.loadImageFromLibrary()
        }
    }
}
