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
var razors = [Int]()
var cuttingCount = 0

for index in 0..<inputs.count{
    if inputs[index] == "(" && inputs[index + 1] != ")"{
        stack.append(index)
    }else if inputs[index] == ")" && inputs[index - 1] == "(" {
        razors.append(index)
    }else{
        let startIndex = stack.removeLast()
        cuttingCount += razors.filter{ $0 > startIndex && $0 < index }.count + 1
    }
}

print("\(cuttingCount)")
