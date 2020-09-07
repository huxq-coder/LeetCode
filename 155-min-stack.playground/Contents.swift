class MinStack {

    var stack: [Int]
    var minStack: [Int]
    
    
    /** initialize your data structure here. */
    init() {
        stack = [Int]()
        minStack = [Int]()
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if minStack.isEmpty {
            minStack.append(x)
        } else {
            minStack.append(min(x, minStack.last!))
        }
    }
    
    func pop() {
        if !stack.isEmpty {
            stack.popLast()
            minStack.popLast()
        }
    }
    
    func top() -> Int {
        if stack.isEmpty {
            return -1
        }
        return stack.last!
    }
    
    func getMin() -> Int {
        if minStack.isEmpty {
            return -1
        }
        return minStack.last!
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
