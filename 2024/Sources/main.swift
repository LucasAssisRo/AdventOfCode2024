//
//  main.swift
//  2024
//
//  Created by Lucas Assis Rodrigues on 12/1/24.
//

let day = 2
let partOne = false

let result: (any Day.Type)! = switch day {
case 1: Day01.self
case 2: Day02.self
default: nil
}


print(partOne ? result.partOne() : result.partTwo())

protocol Day {
    static func partOne() -> Any
    static func partTwo() -> Any
}
