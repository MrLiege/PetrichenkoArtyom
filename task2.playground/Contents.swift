import UIKit

extension String {
    var isPalindrome: Bool {
        let noSpaces = self.replacingOccurrences(of: " ", with: "")
        
        return noSpaces == String(noSpaces.reversed())
    }
}

func main() {
    let string = "леша на полке клопа нашел"
    
    if string.isPalindrome {
        print("Это палендром!")
    } else {
        print("Это не палендром!")
    }
}

main()
