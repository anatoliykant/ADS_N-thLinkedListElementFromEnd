import UIKit

/// Найти n-й элемент в связанном списке с конца
// Сложность O(n)

class ListNode {
	var value: Int
	var next: ListNode?
	
	init(value: Int, next: ListNode?) {
		self.value = value
		self.next = next
	}
}

// 1. С помощью дополнительного массива

func getValue1(from list: ListNode?, with index: Int) -> ListNode? {
	
	guard let list = list else { return nil }
	
	var array = [list]
	var nextNode: ListNode? = list
	
	while nextNode?.next != nil {
		array.append(nextNode!.next!)
		nextNode = nextNode?.next
	}
	
	let count = array.count
	
	guard count > index else { return nil }
	
	return array[count - 1 - index]
}

// 2. С помощью двух циклов

func getValue2(from list: ListNode?, with index: Int) -> ListNode? {
	
	var firstPointer = list
	var secondPointer = list
	
	if index == 0 {
		while secondPointer?.next != nil {
			secondPointer = secondPointer?.next
		}
		return secondPointer
	} else {
		for _ in 0...index - 1 {
			guard secondPointer != nil else { return nil }
			secondPointer = secondPointer?.next
		}
	}
	
	while secondPointer != nil {
		secondPointer = secondPointer?.next
		firstPointer = firstPointer?.next
	}
	return firstPointer
}

// -----------------------------

func createNode(from array: [Int]) -> ListNode? {
	
	var node: ListNode?
	
	for (index, element) in array.reversed().enumerated() {
		if index == 0 {
			node = ListNode(value: element, next: nil)
		} else {
			node = ListNode(value: element, next: node)
		}
	}
	
	return node
}

var array = [1, 6, 3, 8, 4, 5, 1, 2, 7, 7, 7, 3]

let node = createNode(from: array)

dump(getValue1(from: node, with: 6))

dump(getValue2(from: node, with: 7))
