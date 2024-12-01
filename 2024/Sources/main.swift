//
//  main.swift
//  2024
//
//  Created by Lucas Assis Rodrigues on 12/1/24.
//

let day = 3
let partOne = false

let result: (any Day.Type)! = switch day {
case 1: Day01.self
case 2: Day02.self
case 3: Day03.self
default: nil
}

print(partOne ? result.partOne() : result.partTwo())
