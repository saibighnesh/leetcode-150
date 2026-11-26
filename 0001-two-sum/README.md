# 1. Two Sum

- **Topic:** Hashmap
- **Link:** https://leetcode.com/problems/two-sum/
- **Difficulty:** Easy

## Approach

One-pass hash map. For each number, check whether its complement (`target - num`)
was already seen. If yes, return the stored index and the current index. Otherwise
store the current number with its index and continue.

## Complexity

- Time: O(n)
- Space: O(n)

## Languages

- [x] Python
- [x] Java
- [x] C++
- [x] JavaScript
- [x] C#
- [x] Go
- [x] TypeScript
- [x] Kotlin
- [x] Ruby
