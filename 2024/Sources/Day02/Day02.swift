//
//  Day02.swift
//  2024
//
//  Created by Lucas Assis Rodrigues on 12/2/24.
//

import Foundation

// MARK: - Day02

enum Day02: Day {
    static func partOne() -> Any {
        _input.components(separatedBy: .newlines)
            .map { check(report: $0.asArray()) }
            .reduce(0) { $0 + ($1 ? 1 : 0) }
    }

    static func partTwo() -> Any {
        _input.components(separatedBy: .newlines)
            .map { line in
                let line = line.asArray(of: Int.self)
                guard !check(report: line) else { return true }
                let possibleLines = line.indices.map {
                    var line = line
                    line.remove(at: $0)
                    return line
                }
                return possibleLines.contains(where: check)
            }
            .reduce(0) { $0 + ($1 ? 1 : 0) }
    }
}

extension Day02 {
    private static let allowedRange: ClosedRange<UInt> = 1 ... 3

    private static func check(report: [Int]) -> Bool {
        var report = report
        var previousEntry = report.removeFirst()
        var isIncreasing: Bool?
        for entry in report {
            guard allowedRange.contains((entry - previousEntry).magnitude) else { return false }
            switch isIncreasing {
            case true?:
                if entry <= previousEntry { return false }
            case false?:
                if entry >= previousEntry { return false }
            case nil:
                isIncreasing = entry > previousEntry
            }
            previousEntry = entry
        }

        return true
    }
}
