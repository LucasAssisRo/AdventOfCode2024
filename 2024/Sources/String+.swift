//
//  String+.swift
//  2024
//
//  Created by Lucas Assis Rodrigues on 12/2/24.
//

import Foundation

extension String {
    func asArray<Element: FixedWidthInteger>(of element: Element.Type = Element.self) -> [Element] {
        components(separatedBy: .whitespaces).compactMap(Element.init)
    }
}
