//
//  Day01.swift
//  2024
//
//  Created by Lucas Assis Rodrigues on 12/1/24.
//

import Foundation

// MARK: - Day01

enum Day01: Day {
    static func partOne() -> Any {
        var input = input
        input[0].sort()
        input[1].sort()
        return zip(input[0], input[1]).reduce(into: 0) { partialResult, components in
            partialResult += (components.0 - components.1).magnitude
        }
    }

    static func partTwo() -> Any {
        var counts: [UInt: UInt] = [:]
        for element in input[1] {
            counts[element, default: 0] += 1
        }

        return input[0].reduce(0) { partialResult, element in
            partialResult + counts[element, default: 0] * element
        }
    }
}

extension Day01 {
    private static let input = _input.components(separatedBy: .newlines)
        .map { $0.asArray(of: UInt.self) }
        .reduce(into: [[] as [UInt], [] as [UInt]]) { partialResult, components in
            partialResult[0].append(components[0])
            partialResult[1].append(components[1])
        }
}
