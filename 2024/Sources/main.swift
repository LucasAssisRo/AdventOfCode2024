//
//  main.swift
//  2024
//
//  Created by Lucas Assis Rodrigues on 12/1/24.
//

let dayIndex = 4
let day: (any Day.Type)! = switch dayIndex {
case 1: Day01.self
case 2: Day02.self
case 3: Day03.self
case 4: Day04.self
default: nil
}

print(
    """
    Day \(dayIndex)
    Part 1: \(day.partOne())
    Part 2: \(day.partTwo())
    """
)
