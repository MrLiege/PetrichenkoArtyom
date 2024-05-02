import UIKit

func findMaxElement(in array: [Int]) -> Int? {
    let maxElementInArray = array.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }.max()
    
    return maxElementInArray
}

func main() {
    let array = [1, 32, 65, 38, 9, 5, 78, 87, 56, 76]
    
    guard let trueAnswer = findMaxElement(in: array) else {
        print("Такого элемента нет")
        return
    }
    
    print( "Максимальный элемент с четным индексом: \(trueAnswer)")
}

main()
