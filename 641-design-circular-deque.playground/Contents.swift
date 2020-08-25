import Foundation

class MyCircularDeque {
    var deque: [Int]
    var capacity: Int   // 大小
    var front: Int  // 头指针，第一个元素的索引
    var rear: Int   // 尾指针，最后一个元素的下一个索引
    
    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        // 大小多一，避免循环双端队列为 空 和 满 时无法判断
        capacity = k + 1
        deque = [Int](repeating: 0, count: capacity)
        front = 0
        rear = 0
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return front == rear
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        if front == (rear + 1) % capacity {
            return true
        }
        return false
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        // 头插，先向前移动 头指针，再插入数据
        front = (front - 1 + capacity) % capacity
        deque[front] = value
        return true
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        // 尾插，先插入数据，再向后移动尾指针
        deque[rear] = value
        rear = (rear + 1) % capacity
        return true
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        // 头指针向前移动
        front = (front + 1) % capacity
        return true
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        if isEmpty() {
            return false
        }
        // 尾指针向后移动
        rear = (rear - 1 + capacity) % capacity
        return true
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        if isEmpty() {
            return -1
        }
        return deque[front]
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        if isEmpty() {
            return -1
        }
        // 尾指针指向索引是null，取尾指针索引元素时，取尾指针的前一个
        return deque[(rear - 1 + capacity) % capacity]
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */

