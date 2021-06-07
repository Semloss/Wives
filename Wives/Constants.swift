//
//  Constants.swift
//  Wives
//
//  Created by 张松 on 2021/6/6.
//

import Cocoa
import Foundation
import Defaults

// 定义一些常量
// 这里的一些变量可以作为publisher

extension Defaults.Keys {
    // 比如定义打开软件之后展示的页面
    static let libraryimagesavepath = Key<URL?>("libraryimagesavepath", default: nil)
    // 可以使用Defaults.publisher(.isfirstlaunch) 来动态触发事件给订阅者
    static let isfirstlaunch = Key<Bool>("isfirstlaunch", default: false)
}
