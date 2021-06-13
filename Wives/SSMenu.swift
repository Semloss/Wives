//
//  SSMenu.swift
//  Wives
//
//  Created by 张松 on 2021/6/7.
//

import Foundation
import AppKit
import Combine

extension NSMenuItem {
    // 针对初始化
    convenience init(
        _ title: String,
        action: Selector? = nil,
        key: String = "",
        keyModifiers: NSEvent.ModifierFlags? = nil,
        data: Any? = nil,
        isHidden: Bool = false
    ) {
        self.init(title: title, action: action, keyEquivalent: key)
        self.representedObject = data
        self.isHidden = isHidden
        if let keyModifiers = keyModifiers {
            self.keyEquivalentModifierMask = keyModifiers
        }
    }
    
    @discardableResult
    func withSubmenu(_ menu: @autoclosure () -> NSMenu) -> Self {
        submenu = isEnabled ? menu() : NSMenu()
        return self
    }

    @discardableResult
    func withSubmenu(_ menuBuilder: (SSMenu) -> NSMenu) -> Self {
        withSubmenu(menuBuilder(SSMenu()))
    }
}

final class CallbackMenuItem: NSMenuItem {
    init(
        _ title: String,
        key: String = "",
        keyModifiers: NSEvent.ModifierFlags? = nil,
        data: Any? = nil,
        isEnabled: Bool = true,
        isChecked: Bool = false,
        isHidden: Bool = false,
        callback: @escaping (NSMenuItem) -> Void
    ) {
        self.callback = callback
        super.init(title: title, action: #selector(action(_:)), keyEquivalent: key)
        self.target = self
        self.isHidden = isHidden

        if let keyModifiers = keyModifiers {
            self.keyEquivalentModifierMask = keyModifiers
        }
    }

    @available(*, unavailable)
    required init(coder decoder: NSCoder) {
        fatalError(because: .notYetImplemented)
    }

    private let callback: (NSMenuItem) -> Void

    @objc
    func action(_ sender: NSMenuItem) {
        callback(sender)
    }
}


extension NSMenu {
    func addSeparator() {
        addItem(.separator())
    }
    
    @discardableResult
    func addDisabled(_ title: String) -> NSMenuItem {
        let menuItem = NSMenuItem(title)
        menuItem.isEnabled = false
        addItem(menuItem)
        return menuItem
    }
    
    @discardableResult
    func addCallbackItem(
        _ title: String,
        key: String = "",
        keyModifiers: NSEvent.ModifierFlags? = nil,
        data: Any? = nil,
        isHidden: Bool = false,
        callback: @escaping (NSMenuItem) -> Void
    ) -> NSMenuItem {
        let menuItem = CallbackMenuItem(
            title,
            key: key,
            keyModifiers: keyModifiers,
            data: data,
            isHidden: isHidden,
            callback: callback
        )
        addItem(menuItem)
        return menuItem
    }
    
    @discardableResult
    func addSettingsItem() -> NSMenuItem {
        addCallbackItem("Preferences…", key: ",") { _ in
            AppState.showSettingView()
        }
    }
    
    @discardableResult
    func addQuitItem() -> NSMenuItem {
        addSeparator()

        return addCallbackItem("Quit \(AppState.name)", key: "q") { _ in
            AppState.quit()
        }
    }
}

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
        fatalError(because: .notYetImplemented)
    }
}
