import UIKit

/**
 暴力解法
 两次循环，查询出所有的柱形面积，找到最大值
 时间复杂度为O(n^2)
 空间复杂度为O(1)
 提交LeetCode超出时间限制
 */
//func largestRectangleArea(_ heights: [Int]) -> Int {
//    var maxAero = 0
//    if heights.count < 1 {
//        return maxAero
//    }
//    if heights.count == 1 {
//        return heights[0]
//    }
//    // 左边界
//    for i in 0..<heights.count {
//        var minHeight = heights[i]
//        // 右边界
//        for j in i..<heights.count {
//            minHeight = min(minHeight, heights[j])
//            let max = (j-i+1) * minHeight
//            if max > maxAero {
//                maxAero = max
//            }
//        }
//    }
//    return maxAero
//}

    /**
    暴力解法
    内循环中，找到当前索引的左右边界
    时间复杂度为O(n^2)
    空间复杂度为O(1)
    提交LeetCode超出时间限制
    */
//func largestRectangleArea(_ heights: [Int]) -> Int {
//    var maxAero = 0
//    if heights.count < 1 {
//        return maxAero
//    }
//    if heights.count == 1 {
//        return heights[0]
//    }
//    for i in 0..<heights.count {
//        var left = i
//        // 找出最左边 大于等于 当前索引的值
//        while left > 0 && heights[left-1] >= heights[i] {
//            left -= 1
//        }
//        var right = i
//        // 找出最右边 大于等于 当前索引的值
//        while right < heights.count-1 && heights[right+1] >= heights[i] {
//            right += 1
//        }
//        // 找出左右边界最大值，计算最大面积
//        maxAero = max(maxAero, (right - left + 1) * heights[i])
//    }
//    return maxAero
//}

/**
 栈
 单调栈
 单调递增栈
 遍历数组，找到两边第一个小于它的值
         当前值 >= 栈顶元素(索引)对应的值，入栈，确定当前值的右边界
         当前值 < 栈顶元素对应的值，出栈(确定左边界)，直到 当前值 >= 栈顶元素对应的值
 参考链接：https://leetcode-cn.com/problems/largest-rectangle-in-histogram/solution/84-by-ikaruga/
 时间复杂度为O(n)
 空间复杂度为O(n)
 */
func largestRectangleArea(_ heights: [Int]) -> Int {
    var maxAero = 0
    if heights.count < 1 {
        return maxAero
    }
    if heights.count == 1 {
        return heights[0]
    }
    var newHeights = heights;
    // 数组头尾添加0
    newHeights.append(0)
    newHeights.insert(0, at: 0)
    var stack = [Int]()
    for i in 0..<newHeights.count {
        while !stack.isEmpty && newHeights[i] < newHeights[stack.last!] {
            let currentIndex = stack.popLast()!
            // 左边界
            let left = stack.last! + 1
            // 右边界
            let right = i - 1
            maxAero = max((right - left + 1) * newHeights[currentIndex], maxAero)
        }
        stack.append(i)
    }
    return maxAero
}


var heights = [2,1,5,6,2,3]
largestRectangleArea(heights)

