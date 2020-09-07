class MinStack {

    var head: Node? = nil
    
    
    /** initialize your data structure here. */
    init() {
    }
    
    func push(_ x: Int) {
        if head == nil {
            head = Node(value: x, minValue: x, prior: nil)
        } else {
            head = Node(value: x, minValue: min(x, head!.minValue), prior: head!)
        }
        
    }
    
    func pop() {
        head = head?.prior
    }
    
    func top() -> Int {
        return head!.value
    }
    
    func getMin() -> Int {
        return head!.minValue
    }
}

class Node {
    var value: Int = 0
    var minValue: Int = Int.max
    var prior: Node? = nil
    
    init(value: Int, minValue: Int, prior: Node?) {
        self.value = value
        self.minValue = minValue
        self.prior = prior
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

