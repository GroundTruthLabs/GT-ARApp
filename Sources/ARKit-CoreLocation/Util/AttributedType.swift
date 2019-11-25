//
//  AttributedType.swift
//  ARCL
//
//  Created by Tejeshwar Gill on 18/09/2019.
//

import Foundation

/// Wrapper to decorate a type with an attribute
public struct AttributedType<T> {
    public let type: T
    public let attribute: String

    public init(type: T, attribute: String) {
        self.type = type
        self.attribute = attribute
    }
}
