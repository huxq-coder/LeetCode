
// Definition for a binary tree node.
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int) {
      self.val = val
      self.left = nil
      self.right = nil
  }
}

class Solution {
    /**
     前序遍历：中左右
     递归
     */
//    func preorderTraversal(_ root: TreeNode?) -> [Int] {
//        var result = [Int]()
//        helper(root, &result)
//        return result
//    }
    
    func helper(_ node: TreeNode?, _ result: inout [Int]) {
        guard node != nil else {
            return
        }
        result.append(node!.val)
        helper(node?.left, &result)
        helper(node?.right, &result)
    }
    
    /**
     迭代
     官方题解：https://leetcode-cn.com/problems/binary-tree-preorder-traversal/solution/er-cha-shu-de-qian-xu-bian-li-by-leetcode/
     */
//    func preorderTraversal(_ root: TreeNode?) -> [Int] {
//        var result = [Int]()
//        var current = root
//        var stack = [TreeNode]()
//        while !stack.isEmpty || current != nil {
//            while current != nil {
//                stack.append(current!)
//                result.append(stack.last!.val)
//                current = current?.left
//            }
//            current = stack.popLast()?.right
//        }
//        return result
//    }
    
    /**
     在上一步的基础上进行优化
     时间复杂度为O(n)
     空间复杂度为O(n)
     */
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root == nil {
            return result
        }
        // 辅助栈
        var stack = [TreeNode]()
        stack.append(root!)
        while !stack.isEmpty {
            let current = stack.popLast()
            if current != nil {
                result.append(current!.val)
            } else {
                continue
            }
            // 栈：先入后出。入栈时先入右，后入左
            if current?.right != nil {
                stack.append(current!.right!)
            }
            if current?.left != nil {
                stack.append(current!.left!)
            }
        }
        return result
    }
}
