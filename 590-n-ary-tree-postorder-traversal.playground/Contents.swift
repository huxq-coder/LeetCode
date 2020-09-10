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
     后序遍历，从左到右子节点，然后父节点
     判断是否有子节点，有的话递归子节点，没有就直接输出当前节点的值
     
     */
//    func postorder(_ root: Node?) -> [Int] {
//        var result = [Int]()
//        if root == nil {
//            return result
//        }
//        helper(root!, &result)
//        return result
//    }
    
    func helper(_ node: Node, _ result: inout [Int]) {
        if !node.children.isEmpty {
            // 递归遍历所有的子节点
            for child in node.children {
                helper(child, &result)
            }
            // 遍历完所有子节点之后，添加这个父节点
            result.append(node.val)
        } else {
            // 没有子节点，直接添加这个节点
            result.append(node.val)
        }
    }
    
    /**
     迭代
     参考题解：https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/solution/ncha-shu-de-hou-xu-bian-li-by-leetcode/
     时间复杂度为O(M) M：N叉树的节点个数
     空间复杂度为O(M)
     */
    func postorder(_ root: Node?) -> [Int] {
        var result = [Int]()
        if root == nil {
            return result
        }
        var stack = [Node]()
        stack.append(root!)
        while !stack.isEmpty {
            let current = stack.popLast()
            // 头插
            result.insert(current!.val, at: 0)
            // 子节点存在，依次入栈
            if !current!.children.isEmpty {
                for child in current!.children {
                    stack.append(child)
                }
            }
        }
        return result
    }
}
