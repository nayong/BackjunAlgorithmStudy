//
//  main.swift
//  stack_10799
//
//  Created by 김나용 on 2018. 3. 17..
//  Copyright © 2018년 김나용. All rights reserved.
//

/* Cautions
 - Input string is not null
 - The first input string should be "("
 - Input string have the same number of "(" and ")"
 */

import Foundation

let inputs = Array(readLine()!)
var stack = [Int]()
var ranges = [(startIndex: Int, endIndex: Int)]()
var razors = [(Int)]()
var cuttingCount = 0

//replace expresstion of razor(=="()") with "O"
var filteredInput = inputs
for i in 0..<inputs.count{
    if inputs[i] == "(" && inputs[i+1] == ")"{ //input[i] can't be "(", so inputs[i+1] will never be accessed
        filteredInput[i] = "O"
        filteredInput[i+1] = "X"
    }
}
filteredInput = filteredInput.filter{$0 != "X"}

for index in 0..<filteredInput.count{
    switch filteredInput[index]{
    case "(":
        stack.append(index)
    case ")":
        ranges.append((stack.removeLast(), index))
    case "O":
        razors.append(index)
    default:
        break
    }
}

for range in ranges{
    cuttingCount += razors.filter{ $0 > range.startIndex && $0 < range.endIndex }.count + 1
}

print("\(cuttingCount)")

