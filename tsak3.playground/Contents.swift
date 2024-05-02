import UIKit

struct Restaurant {
    let name: String
    let rating: Double
    let timeDelivery: Double
    
    private let numberOfDishes: Int
        
    init(name: String, rating: Double, timeDelivery: Double) {
        self.name = name
        self.rating = rating
        self.timeDelivery = timeDelivery
        self.numberOfDishes = 5
    }
    
    private init(name: String, rating: Double, timeDelivery: Double, numberOfDishes: Int) {
        self.name = name
        self.rating = rating
        self.timeDelivery = timeDelivery
        self.numberOfDishes = numberOfDishes
    }
    
    func updateNumberOfDishes(num updatedNumberOfDishes: Int) -> Restaurant {
        return Restaurant(name: self.name, rating: self.rating, timeDelivery: self.timeDelivery, numberOfDishes: updatedNumberOfDishes)
    }
}

struct TyndexFood {
    
    var restaurants: [Restaurant]
    
    mutating func sortByName() {
        restaurants.sort { $0.name < $1.name }
    }
    
    mutating func sortByRating() {
        restaurants.sort { $0.rating > $1.rating }
    }
    
    mutating func sortByDeliveryTime() {
        restaurants.sort { $0.timeDelivery < $1.timeDelivery }
    }
}


func main() {
    var tyndexFood = TyndexFood(restaurants: [Restaurant(name: "Skygarden", rating: 3.1, timeDelivery: 0.5),
                                              Restaurant(name: "Soho", rating: 4.0, timeDelivery: 1.0),
                                              Restaurant(name: "Гастродвор", rating: 4.1, timeDelivery: 0.2),
                                              Restaurant(name: "Вкусно и Точка", rating: 4.6, timeDelivery: 0.5),
                                              Restaurant(name: "Rostic`s", rating: 4.6, timeDelivery: 0.5),
                                              Restaurant(name: "Папа джонс", rating: 4.3, timeDelivery: 0.3),
                                              Restaurant(name: "Инари", rating: 4.5, timeDelivery: 0.6),
                                              Restaurant(name: "G-Pizza", rating: 4.1, timeDelivery: 1.2),
                                              Restaurant(name: "Evil Chef", rating: 4.4, timeDelivery: 1.3),
                                              Restaurant(name: "Сашими", rating: 3.9, timeDelivery: 2.5),
                                              Restaurant(name: "Сушм и Точка", rating: 3.9, timeDelivery: 2.5),
                                              Restaurant(name: "Мангал & Кебаб", rating: 4.3, timeDelivery: 2.1)
                                             ])
    
    
    var numberOfDishesArray = [88, 74, 88, 72, 71, 85, 89, 62, 94, 84, 64, 96]
    
    updateNumberOfDishesForRestaurants(in: &tyndexFood, with: numberOfDishesArray)
    
    sortAndPrint(sortOption: 1)
    sortAndPrint(sortOption: 2)
    sortAndPrint(sortOption: 3)
    
    
    func updateNumberOfDishesForRestaurants(in tyndexFood: inout TyndexFood, with numberOfDishesArray: [Int]) {
        for (index, restaurant) in tyndexFood.restaurants.enumerated() {
            let updatedNumberOfDishes = numberOfDishesArray[index]
            let updatedRestaurant = restaurant.updateNumberOfDishes(num: updatedNumberOfDishes)
            tyndexFood.restaurants[index] = updatedRestaurant
        }
    }
    
    func sortAndPrint(sortOption: Int) {
        switch sortOption {
        case 1:
            print("Сортировка ресторанов по названию:")
            tyndexFood.sortByName()
        case 2:
            print("Сортировка ресторанов по рейтингу:")
            tyndexFood.sortByRating()
        case 3:
            print("Сортировка ресторанов по времени доставки:")
            tyndexFood.sortByDeliveryTime()
        default:
            print("Такой опции нет(")
            return
        }
        
        for restaurant in tyndexFood.restaurants {
            print(restaurant)
        }
    }
}

main()
