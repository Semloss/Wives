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
    static let shared = AppState()
    // 图片资源list
    var libraryImageList : [NSImage] = []
    // 左边栏的选择状态，以及展示的wording
    var mainStatusIcon = NSImage(named: "MenuBarIcon")
    // 下载的壁纸图片保存的位置, 其实可以存在default里面
    var libraryImageSavePath = Defaults[.libraryimagesavepath]
    
    static let name = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as! String
//     app相关数据
//    let id = Bundle.main.bundleIdentifier!
//    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
//    let build = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
//    let url = Bundle.main.bundleURL


    
    let mainMenu = SSMenu()
    // 设置titlebar的图标以及菜单
    private(set) lazy var mainStatusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    // 创建一个引用
    private(set) lazy var mainStatusItemButton = mainStatusItem.button
    
    // init
    init() {
        initMainStatusItem()
        //加载菜单栏
        showMenu()
        load()
    }
    
    private func load() {
//        DispatchQueue.main.async {
//            // 第一步检查是否有文件夹，如果没有，则创建，如果有，则加载
//            // 打开app时候加载图片也可以放在这做
//            self.loadImageFromLibrary()
//        }
        self.loadImageFromLibrary()
    }
}
