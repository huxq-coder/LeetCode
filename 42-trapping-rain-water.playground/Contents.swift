import UIKit

/**
 暴力解法
 current接水高度 = min(max(left), max(right)) - currentHeight
 两次循环，查询当前索引左右的最大值
 时间复杂度为O(n^2)
 空间复杂度为O(1)
 */
//func trap(_ height: [Int]) -> Int {
//    // 过滤边界条件，三个以下无法形成漏斗接水
//    if height.count <= 2 {
//        return 0
//    }
//    var result = 0
//    for i in 1..<height.count {
//        var left = i - 1
//        var right = i + 1
//        var maxLeft = 0
//        var maxRight = 0
//        // current接水高度 = min(max(left), max(right)) - currentHeight
//        while left >= 0 || right < height.count {
//            // 向左查询
//            if left >= 0 {
//                if height[left] > maxLeft {
//                    maxLeft = height[left]
//                }
//                left -= 1
//            }
//            // 向右查询
//            if right < height.count {
//                if height[right] > maxRight {
//                    maxRight = height[right]
//                }
//                right += 1
//            }
//        }
//        let minValue = min(maxLeft, maxRight)
//        if minValue - height[i] > 0 {
//            result += (minValue - height[i])
//        }
//    }
//    return result
//}

/**
 动态规划：空间换时间
 利用 左边最大值数组、右边最大值数组 保存每个索引处的左右的最大值
 时间复杂度为O(n)
 空间复杂度为O(n)
 */
//func trap(_ height: [Int]) -> Int {
//    // 过滤边界条件，三个以下无法形成漏斗接水
//    if height.count <= 2 {
//        return 0
//    }
//    var maxLeft = [Int](repeating: 0, count: height.count)
//    var maxRight = [Int](repeating: 0, count: height.count)
//    // 从 左 向 右 遍历，找出每个索引处的左边最大值
//    for i in 1..<height.count {
//        maxLeft[i] = max(maxLeft[i-1], height[i-1])
//    }
//    // 从 右 向 左 遍历，找出每个索引处的右边最大值
//    for i in (0...height.count-2).reversed() {
//        maxRight[i] = max(maxRight[i+1], height[i+1])
//        print(maxRight, height)
//    }
//    var sum = 0
//    for i in 1..<height.count {
//        let minValue = min(maxLeft[i], maxRight[i])
//        if minValue > height[i] {
//            sum += (minValue - height[i])
//        }
//    }
//    return sum
//}

/**
 双指针
 利用头尾指针向中间靠拢，
 maxLeft < maxRight 计算left索引的接水量
 反之，计算right索引的接水量
 
  当前索引接水高度 = min(max(left), max(right)) - currentHeight
 
 参考题解：https://leetcode-cn.com/problems/trapping-rain-water/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-w-8/
 
 https://leetcode-cn.com/problems/trapping-rain-water/solution/jie-yu-shui-by-leetcode/327718/ 官方题解的「Lucien」的评论解释比较容易理解，有兴趣的同学可以看下
 「
 定理一：在某个位置i处，它能存的水，取决于它左右两边的最大值中较小的一个。
 定理二：当我们从左往右处理到left下标时，左边的最大值left_max对它而言是可信的，但right_max对它而言是不可信的。（见下图，由于中间状况未知，对于left下标而言，right_max未必就是它右边最大的值）
 定理三：当我们从右往左处理到right下标时，右边的最大值right_max对它而言是可信的，但left_max对它而言是不可信的。
 」
 时间复杂度为O(n)
 空间复杂度为O(1)
 */
//func trap(_ height: [Int]) -> Int {
//    // 过滤边界条件，三个以下无法形成漏斗接水
//    if height.count <= 2 {
//        return 0
//    }
//    // 左右边界无法接水，所以初始化值向中间了一个索引
//    var left = 1
//    var right = height.count-2
//    // 左右边界索引值作为左右最大值的初始化值
//    var maxLeft = height[0];
//    var maxRight = height[height.count-1]
//    var sum = 0
//    while left <= right {
//        // min(maxLeft, maxRight)，确定左侧最大值小
//        if maxLeft <= maxRight {
//            /**
//             |
//             |                  |
//             |       |          |
//             ↑       ↑          ↑
//           maxLeft  left     maxRight
//             */
//            if maxLeft > height[left] {
//                sum += (maxLeft - height[left])
//            }
//            if height[left] > maxLeft {
//                maxLeft = height[left]
//            }
//            left += 1
//        } else {
//            if maxRight > height[right] {
//                sum += (maxRight - height[right])
//            }
//            if height[right] > maxRight {
//                maxRight = height[right]
//            }
//            right -= 1
//        }
//    }
//    return sum
//}

/**
 栈
 单调栈（有序，单调递增 或 单调递减）
 栈中存储索引，索引值是单调递减
 栈作为辅助存储空间，当前索引值小于栈顶索引值，入栈；
 反之，计算接水量
 当前索引 = 栈顶元素
 width = 右边墙 i - 左边（栈顶元素(pop出栈顶相同的元素之后的值)）
 height = min(右面墙(height[i])， 左边(height[栈顶元素])) - 当前索引高度
 参考题解：https://leetcode-cn.com/problems/trapping-rain-water/solution/dan-diao-zhan-jie-jue-jie-yu-shui-wen-ti-by-sweeti/
 
 */
func trap(_ height: [Int]) -> Int {
    // 过滤边界条件，三个以下无法形成漏斗接水
    if height.count <= 2 {
        return 0
    }
    var stack = [Int]()
    var sum = 0
    for i in 0..<height.count {
        while !stack.isEmpty && height[i] > height[stack.last!] {
            // 当前索引
            let currentIndex = stack.last!
            // pop出栈顶相同的元素
            /**
             |
             |       |
             |       |     |    |       |
             ↑       ↑     ↑    ↑       ↑
                stack.peek()        currentIndex
             */
            while !stack.isEmpty && height[stack.last!] == height[currentIndex] {
                stack.popLast()
            }
            if !stack.isEmpty {
                let width = i - stack.last! - 1
                let height = min(height[i], height[stack.last!]) - height[currentIndex]
                sum += width * height
            }
        }
        stack.append(i)
    }
    return sum
}

let height = [0,1,0,2,1,0,1,3,2,1,2,1]
trap(height)

