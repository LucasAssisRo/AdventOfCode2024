//
//  Collection+.swift
//  2024
//
//  Created by Lucas Assis Rodrigues on 12/4/24.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}
