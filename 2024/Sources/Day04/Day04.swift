//
//  Day04.swift
//  2024
//
//  Created by Lucas Assis Rodrigues on 12/4/24.
//

import Foundation

enum Day04: Day {
    // MARK: Nested Types

    enum Direction: CaseIterable {
        case right
        case left
        case up
        case down
        case diagonalDownRight
        case diagonalUpRight
        case diagonalDownLeft
        case diagonalUpLeft

        // MARK: Computed Properties

        var offset: (row: Int, column: Int) {
            switch self {
            case .right: (0, 1)
            case .left: (0, -1)
            case .up: (-1, 0)
            case .down: (1, 0)
            case .diagonalDownRight: (1, 1)
            case .diagonalDownLeft: (1, -1)
            case .diagonalUpLeft: (-1, -1)
            case .diagonalUpRight: (-1, 1)
            }
        }
    }

    // MARK: Static Properties

    static let input: [[Character]] = _input.components(separatedBy: .newlines)
        .map(Array.init)

    // MARK: Static Functions

    static func partOne() -> Any {
        var xmasCount = 0
        let xmas = Array("XMAS")
        for (row, rowIndex) in zip(input, input.indices) {
            for (element, columnIndex) in zip(row, row.indices) where element == "X" {
                for direction in Direction.allCases {
                    let word = (0 ..< 4).compactMap { (distance: Int) -> Character? in
                        let rowIndex = rowIndex + direction.offset.row * distance
                        let columnIndex = columnIndex + direction.offset.column * distance
                        return input[safe: rowIndex]?[safe: columnIndex]
                    }

                    if word == xmas {
                        xmasCount += 1
                    }
                }
            }
        }

        return xmasCount
    }

    static func partTwo() -> Any {
        struct Corners: Equatable  {
            let topLeft: Character?
            let topRight: Character?
            let bottomLeft: Character?
            let bottomRight: Character?
        }
        
        var xMASCount = 0
        for (row, rowIndex) in zip(input, input.indices) {
            for (element, columnIndex) in zip(row, row.indices) where element == "A" {
        
                let validCorners: [Corners] = [
                    Corners(topLeft: "M", topRight: "M", bottomLeft: "S", bottomRight: "S"),
                    Corners(topLeft: "S", topRight: "S", bottomLeft: "M", bottomRight: "M"),
                    Corners(topLeft: "M", topRight: "S", bottomLeft: "M", bottomRight: "S"),
                    Corners(topLeft: "S", topRight: "M", bottomLeft: "S", bottomRight: "M"),
                ]
                
                let corners = Corners(
                    topLeft: input[safe: rowIndex - 1]?[safe: columnIndex - 1],
                    topRight: input[safe: rowIndex - 1]?[safe: columnIndex + 1],
                    bottomLeft: input[safe: rowIndex + 1]?[safe: columnIndex - 1],
                    bottomRight: input[safe: rowIndex + 1]?[safe: columnIndex + 1]
                )

                if validCorners.contains(corners) {
                    xMASCount += 1
                }
            }
        }

        return xMASCount
    }
}
