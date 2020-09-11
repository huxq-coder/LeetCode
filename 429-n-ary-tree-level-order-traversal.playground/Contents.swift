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
     迭代
     队列辅助存储
     */
//    func levelOrder(_ root: Node?) -> [[Int]] {
//        var result = [[Int]]()
//        if root == nil {
//            return result
//        }
//        // 辅助存储队列：先进先出
//        var queue = [Node]()
//        queue.insert(root!, at: 0)
//        while !queue.isEmpty {
//            // 单行数组
//            var level = [Int]()
//            // 单行个数
//            let count = queue.count
//            // 遍历单行节点
//            for _ in 0..<count {
//                // 尾出
//                let current = queue.popLast()
//                level.append(current!.val)
//                if !current!.children.isEmpty {
//                    // 子节点 头插队列
//                    for child in current!.children {
//                        queue.insert(child, at: 0)
//                    }
//                }
//            }
//            result.append(level)
//        }
//        return result
//    }
    
    /**
     递归
     参考官方题解：https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/solution/ncha-shu-de-ceng-xu-bian-li-by-leetcode/
     时间复杂度为O(n) n：节点数量
     空间复杂度为O(n)
     */
    // 结果数组
    var result = [[Int]]()
    func levelOrder(_ root: Node?) -> [[Int]] {
        dfs(root, 0)
        return result
    }
    
    func dfs(_ node: Node?, _ level: Int) {
        if node == nil {
            return
        }
        // 每一层的第一个节点的层级数 == 结果集的count
        // 结果集的总数 和 层级数 相同，新建一个层级的结果集
        /**
         level      result.count
           0            0(默认没有数据)
           1            1(添加了上一个层级的数据集)
           2            2(同上)
           ...
         */
        if result.count == level {
            result.append([Int]())
        }
        result[level].append(node!.val)
        // 有子节点，层级向下深入一级
        for child in node!.children {
            dfs(child, level + 1)
        }
    }
}

