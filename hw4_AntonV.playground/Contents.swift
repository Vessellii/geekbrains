//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.


import UIKit

enum Doors{
    case open, close
}
enum UsedCar {
    case new, used
}
enum Transmission {
        case manual, auto, robotic
}

class Car {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var newOrUsed: UsedCar
    var range: Double
    var doors: Doors
    init(color:UIColor, mp3:Bool, transmission:Transmission, newOrUsed:UsedCar, range:Double, doors:Doors){
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.newOrUsed = newOrUsed
        self.range = range
        self.doors = doors
    }
    func usedOrNotused(){
        if range < 10 { newOrUsed = .new}
        else { newOrUsed = .used}
        
    }
    
}

class SportCar: Car{
    let turbo: Bool
    init(color:UIColor, mp3:Bool, transmission:Transmission, newOrUsed:UsedCar, range:Double, doors:Doors, turbo:Bool){
        self.turbo = turbo
        super.init(color: color, mp3: mp3, transmission: transmission, newOrUsed: newOrUsed, range: range, doors: doors)
    }
    func OpenDoor(){
        doors = .open
    }
    func CloseDoor(){
        doors = .close
    }
}

class TrunkCar: Car{
    var trunkMaxVolume: Double
    var trunkVolume: Double
    init(color: UIColor, mp3: Bool, transmission: Transmission, newOrUsed: UsedCar, range: Double, doors: Doors, trunkMaxVolume: Double, trunkVolume: Double) {
        self.trunkMaxVolume = trunkMaxVolume
        self.trunkVolume = trunkVolume
        super.init(color: color, mp3: mp3, transmission: transmission, newOrUsed: newOrUsed, range: range, doors: doors)
    }
    func loadTrunk(loadVolume: Double){
        trunkVolume = trunkVolume + loadVolume
        if trunkVolume > trunkMaxVolume {
            print("недопустимый объем загрузки");
            trunkVolume = trunkVolume - loadVolume
            }
    }
}
let car1 = TrunkCar(color: .black, mp3: false, transmission: .manual, newOrUsed: .new, range: 0, doors: .close, trunkMaxVolume: 1000, trunkVolume: 100)

car1.loadTrunk(loadVolume: 1000)
print(car1.trunkVolume)


