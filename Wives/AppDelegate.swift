//
//  AppDelegate.swift
//  Wives
//
//  Created by 张松 on 2021/6/6.
//

import Foundation

// 委托类
final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationWillBecomeActive(_ notify: Notification) {
        // 其实这里也可以去加载一些东西
        NSLog("for test")
    }
}
