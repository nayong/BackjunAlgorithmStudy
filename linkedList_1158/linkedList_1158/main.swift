//
//  main.swift
//  linkedList_1158
//
//  Created by 김나용 on 2018. 3. 18..
//  Copyright © 2018년 김나용. All rights reserved.
//

import Foundation

class Node{
    let data: Int
    var prev: Node?
    var next: Node?
    
    init(data: Int, prev: Node?, next: Node?) {
        self.data = data
        self.prev = prev
        self.next = next
    }
}

class LinkedList{
    var head: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(data: Int) {
        let newNode = Node(data: data, prev: nil, next: nil)
        if let headNode = head {
            newNode.prev = headNode.prev
            newNode.next = headNode
            headNode.prev?.next = newNode
            headNode.prev = newNode
            head = headNode
        }else {
            newNode.prev = newNode
            newNode.next = newNode
            head = newNode
        }
    }
    
    func delete(node: Node) -> Int{
        if node.next!.data == node.data {
            head = nil
        } else{
            node.prev?.next = node.next
            node.next?.prev = node.prev
            if node.data == head?.data{
                head = node.next
            }
        }
        return node.data
    }
}

let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let M = Int(input[1])!
var list = LinkedList.init()

for i in 1...N{
    list.append(data: i)
}

var resultString = "<"
var deletedNode = list.head
while list.head != nil {
    for _ in 1..<M{
        deletedNode = deletedNode?.next
    }
    resultString += "\(list.delete(node: deletedNode!)), "
    deletedNode = deletedNode?.next
}
print("\(resultString.dropLast(2) + ">")")
