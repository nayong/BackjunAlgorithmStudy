//
//  main.swift
//  greedy_10610
//
//  Created by 김나용 on 2018. 3. 25..
//  Copyright © 2018년 김나용. All rights reserved.
//

import Foundation

let inputs = (Array(readLine()!)).map({Int(String($0))!})

let numberOfZero = inputs.filter{ $0 == 0 }.count
if numberOfZero == 0 {
    print("-1")
} else{
    if (((inputs.reduce(0) { $0 + $1 }) % 3) == 0) {
        print("\((inputs.filter{$0 != 0}.sorted(by: >).map({String($0)})).joined())", terminator: "")
        for _ in 0..<numberOfZero{
            print("0", terminator: "")
        }
    }else{
        print("-1")
    }
}
