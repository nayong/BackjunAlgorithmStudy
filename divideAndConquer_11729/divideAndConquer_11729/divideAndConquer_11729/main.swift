//
//  main.swift
//  divideAndConquer_11729
//
//  Created by 김나용 on 2018. 4. 5..
//  Copyright © 2018년 김나용. All rights reserved.
//

import Foundation

var count = 0
var results = [String]()
func move(from: Int, to: Int){
    count += 1
    results.append("\(from) \(to)")
}
func hanoi(n: Int, from: Int, by: Int, to: Int){
    if n == 1{
        move(from: from, to: to)
    }else{
        hanoi(n: n - 1, from: from, by: to, to: by)
        move(from: from, to: to)
        hanoi(n: n - 1, from: by, by: from, to: to)
    }
}
hanoi(n: Int(readLine()!)!, from: 1, by: 2, to: 3)
print(count)
for result in results{
    print(result)
}

