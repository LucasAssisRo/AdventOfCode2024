//
//  main.swift
//  2024
//
//  Created by Lucas Assis Rodrigues on 12/1/24.
//

let day = 1
let partOne = false

let result = switch day {
case 1: "\(partOne ? Day01.part1() : Day01.part2())"
default: "Invalid day"
}

print(result)
