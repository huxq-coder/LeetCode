
// Definition for a Node.
public class Node {
  public var val: Int
  public var children: [Node]
  public init(_ val: Int) {
      self.val = val
      self.children = []
  }
}
 

class Solution {
    /**
     递归
     */
//    func preorder(_ root: Node?) -> [Int] {
//        var result = [Int]()
//        if root == nil {
//            return result
//        }
//        helper(root!, &result)
//        return result
//    }
    
    func helper(_ current: Node, _ result: inout [Int]) {
        result.append(current.val)
        if !current.children.isEmpty {
            for child in current.children {
                helper(child, &result)
            }
        }
    }
    
    /**
     迭代
     */
    func preorder(_ root: Node?) -> [Int] {
        var result = [Int]()
        var stack = [Node]()
        if root == nil {
            return result
        }
        stack.append(root!)
        while !stack.isEmpty {
            let current = stack.popLast()
            result.append(current!.val)
            if !current!.children.isEmpty {
                for child in current!.children.reversed() {
                    stack.append(child)
                }
            }
        }
        return result
    }
}
