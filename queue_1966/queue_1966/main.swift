//
//  main.swift
//  queue_1966
//
//  Created by 김나용 on 2018. 2. 17..
//  Copyright © 2018년 Nayong. All rights reserved.
//

import Foundation

typealias Document = (name:Int, value:Int)

struct Queue {
    var documentList = [Document]()
    mutating func enqueue(_ element: Document) {
        documentList.append(element)
    }
    mutating func dequeue() -> Document?{
        if !documentList.isEmpty{
            let firstItem = peek()
            documentList.remove(at: documentList.startIndex)
            return firstItem
        }else{
            return nil
        }
    }
    mutating func peek() -> Document{
        return documentList[documentList.startIndex]
    }
    func isMax(value: Int) -> Bool {
        for document in documentList{
            if document.value > value {
                return false
            }
        }
        return true
    }
}

var myQueue = Queue.init()
var myResult = [Int]()

let numberOfTest = Int(readLine()!)!

for _ in 0..<numberOfTest{
    let testInfoLine = readLine()?.components(separatedBy: " ")
    let numberOfDocuments = Int(testInfoLine![0])!
    let documentIndex = Int(testInfoLine![1])!
    
    let values = readLine()?.components(separatedBy: " ")
    for j in 0..<numberOfDocuments{
        myQueue.enqueue(Document(name: j, value: Int(values![j])!))
    }
    
    var searchCount = 0
    var searched = false
    
    while !searched {
        if myQueue.isMax(value: myQueue.peek().value){
            if let dequeuedItem = myQueue.dequeue(){
                searchCount += 1
                if dequeuedItem.name == documentIndex{
                    myResult.append(searchCount)
                    searched = true
                }
            }
        }else{
            if let dequeuedItem = myQueue.dequeue(){
                myQueue.enqueue(dequeuedItem)
            }
        }
    }
    myQueue.documentList.removeAll()
}

for result in myResult {
    print("\(result)")
}
