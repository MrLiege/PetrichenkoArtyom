import UIKit

protocol LinkedListProtocol {
    associatedtype T
    func append(value: T)
    func removeAt(atIndex index: Int) -> T?
}

class LLNode<T> {
    var value: T
    var next: LLNode?
    var previous: LLNode?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T>: LinkedListProtocol {
    typealias Node = LLNode<T>
    private var head: Node?
    
    var llPrint: String {
        var stringArray = "["
        guard var node = head else { return stringArray + "]" }
        
        while let next = node.next {
            stringArray += "\(node.value), "
            node = next
        }
        
        stringArray += "\(node.value)"
        return stringArray + "]"
    }
    
    func append(value: T) {
        let newNode = Node(value: value)
        newNode.next = head
        head?.previous = newNode
        head = newNode
    }
    
    func node(atIndex index: Int) -> Node? {
        if index == 0 {
            return head
        } else {
            var node = head?.next
            
            for _ in 1 ..< index {
                node = node?.next
                if node == nil { break }
            }
            
            return node
        }
    }
    
    func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    func removeAt(atIndex index: Int) -> T? {
        guard index >= 0 else {
            print("Индекс должен быть положительным:(")
            return nil
        }
        
        guard let nodeToRemove = node(atIndex: index) else {
            print("Такого узла с данным индексом нет:(")
            return nil
        }
        
        return remove(node: nodeToRemove)
    }
}

struct Action<T> {
    let type: String
    let value: T
}

func main() {
    let list = LinkedList<String>()
    let actions: [Action<Any>] = [Action(type: "append", value: "один"),
                                   Action(type: "append", value: "два"),
                                   Action(type: "removeAt", value: 1),
                                   Action(type: "append", value: "3"),
                                   Action(type: "append", value: "ч3тыре"),
                                   Action(type: "removeAt", value: 3),
                                   Action(type: "removeAt", value: 0)]
    
    
    func performAction(action: Action<Any>) {
        switch action.type {
        case "append":
            if let value = action.value as? String {
                print("Вставка в начало списка: \(value)")
                list.append(value: value)
                print(list.llPrint)
            }
        case "removeAt":
            if let index = action.value as? Int {
                print("Удаление по индексу: \(index)")
                list.removeAt(atIndex: index)
                print(list.llPrint)
            }
        default:
            print("Такой опции нет:(")
        }
    }
    
    for action in actions {
        performAction(action: action)
    }
}

main()
