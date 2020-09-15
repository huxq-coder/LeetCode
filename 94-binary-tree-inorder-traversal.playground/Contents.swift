
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
     递归算法
     官方题解：https://leetcode-cn.com/problems/binary-tree-inorder-traversal/solution/er-cha-shu-de-zhong-xu-bian-li-by-leetcode/
     时间复杂度为O(n)
     空间复杂度为O(n)
     */
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        var result = [Int]()
//        if root != nil {
//            helper(root!, &result)
//        }
//        return result
//    }
    
    func helper(_ root: TreeNode, _ result: inout [Int]) {
        // 左
        if root.left != nil {
            helper(root.left!, &result)
        }
        // 中
        result.append(root.val)
        // 右
        if root.right != nil {
            helper(root.right!, &result)
        }
    }
    
    /**
     栈
     
     参考题解：https://leetcode-cn.com/problems/binary-tree-inorder-traversal/solution/die-dai-fa-by-jason-2/
     作者：jason-2
     每到一个节点 A，因为根的访问在中间，将 A 入栈。然后遍历左子树，接着访问 A，最后遍历右子树。
     在访问完 A 后，A 就可以出栈了。因为 A 和其左子树都已经访问完成。
     
     时间复杂度为O(n)
     空间复杂度为O(n)
     */
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [TreeNode]()
        var current = root
        while current != nil || !stack.isEmpty {
            // 当前节点不为nil，入栈，移动到左节点
            while current != nil {
                stack.append(current!)
                current = current?.left
            }
            // 没有子节点了，出栈当前节点(父节点)
            current = stack.popLast()
            result.append(current!.val)
            // 移动到右节点
            current = current?.right
        }
        
        return result
    }
}
