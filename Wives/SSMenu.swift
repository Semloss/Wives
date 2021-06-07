//
//  SSMenu.swift
//  Wives
//
//  Created by 张松 on 2021/6/7.
//

import Foundation
import AppKit
import Combine

final class SSMenu: NSMenu {
    // 这里就是一个publisher
    private let needsUpdateSubject = PassthroughSubject<Void, Never>()

    private(set) var isOpen = false
    let needsUpdatePublisher: AnyPublisher<Void, Never>

    override init(title: String) {
        self.needsUpdatePublisher = needsUpdateSubject.eraseToAnyPublisher()
        super.init(title: title)
    }

    @available(*, unavailable)
    required init(coder decoder: NSCoder) {
    }
////
//    func menuWillOpen(_ menu: NSMenu) {
//        isOpen = true
//        isOpenSubject.send(true)
//    }
//
//    func menuDidClose(_ menu: NSMenu) {
//        isOpen = false
//        isOpenSubject.send(false)
//    }
//
//    func menuNeedsUpdate(_ menu: NSMenu) {
//        needsUpdateSubject.send()
//    }
}
