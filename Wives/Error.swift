//
//  Error.swift
//  Wives
//
//  Created by 张松 on 2021/6/13.
//

import Foundation

public struct FatalReason: CustomStringConvertible {
    /// Die because this code branch should be unreachable.
    public static let unreachable = Self("Should never be reached during execution.")
    
    public static let createfolderfailed = Self("Create Library Floder Failed.")

    /// Die because this method or function has not yet been implemented.
    public static let notYetImplemented = Self("Not yet implemented.")

    /// Die because a default method must be overridden by a
    /// subtype or extension.
    public static let subtypeMustOverride = Self("Must be overridden in subtype.")

    /// Die because this functionality should never be called,
    /// typically to silence requirements.
    public static let mustNotBeCalled = Self("Should never be called.")
    
    public static let jsonParseError = Self("Json Parse Error.")

    /// An underlying string-based cause for a fatal error.
    public let reason: String

    /// Establishes a new instance of a `FatalReason` with a string-based explanation.
    public init(_ reason: String) {
        self.reason = reason
    }

    /// Conforms to CustomStringConvertible, allowing reason to
    /// print directly to complaint.
    public var description: String { reason }
}

public func fatalError(
    because reason: FatalReason,
    function: StaticString = #function,
    file: StaticString = #fileID,
    line: Int = #line
) -> Never {
    fatalError("\(function): \(reason)", file: file, line: UInt(line))
}
