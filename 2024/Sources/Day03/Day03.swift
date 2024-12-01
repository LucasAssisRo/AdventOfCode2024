//
//  Day03.swift
//  2024
//
//  Created by Lucas Assis Rodrigues on 12/3/24.
//

import Foundation

// MARK: - Day03

enum Day03: Day {
    static func partOne() -> Any {
        var stack = ""
        var result = 0
        for char in _input {
            switch (stack.last, char) {
            case ("l"?, "("),
                 ("m"?, "u"),
                 (nil, "m"),
                 ("u"?, "l"):
                stack.append(char)
            case let ("("?, char) where char.isNumber,
                 let (","?, char) where char.isNumber:
                stack.append(char)
            case let (last?, char) where last.isNumber && char.isNumber:
                stack.append(char)
            case let (last?, ",") where last.isNumber:
                stack.append(char)
            case let (last?, ")") where last.isNumber && stack.contains(","):
                let values = stack.dropFirst(4)
                    .components(separatedBy: CharacterSet(charactersIn: ","))
                    .map { Int($0)! }
                result += values[0] * values[1]
                stack.removeAll()
            default:
                stack.removeAll()
            }
        }
        return result
    }

    static func partTwo() -> Any {
        var stack = ""
        var result = 0
        var isEnabled = true
        for char in _input {
            switch (stack.last, char) {
            case ("'"?, "t"),
                 ("d"?, "o"),
                 ("n"?, "'"),
                 (nil, "d"),
                 ("o"?, "("),
                 ("o"?, "n"),
                 ("t"?, "("):
                stack.append(char)
            case ("("?, ")"):
                isEnabled = stack == "do("
                stack.removeAll()
            case (nil, "m") where isEnabled,
                 ("m"?, "u") where isEnabled,
                 ("u"?, "l") where isEnabled,
                 ("l"?, "(") where isEnabled:
                stack.append(char)
            case let ("("?, char) where char.isNumber && isEnabled,
                 let (","?, char) where char.isNumber && isEnabled:
                stack.append(char)
            case let (last?, char) where last.isNumber && char.isNumber && isEnabled:
                stack.append(char)
            case let (last?, ",") where last.isNumber && isEnabled:
                stack.append(char)
            case let (last?, ")") where last.isNumber && stack.contains(",") && isEnabled:
                let values = stack.dropFirst(4)
                    .components(separatedBy: CharacterSet(charactersIn: ","))
                    .map { Int($0)! }
                result += values[0] * values[1]
                stack.removeAll()
            default:
                stack.removeAll()
            }
        }
        return result
    }
}
