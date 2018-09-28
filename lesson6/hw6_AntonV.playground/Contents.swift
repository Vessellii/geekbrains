import UIKit

//используем обьявление типов и классов из прошлого ДЗ

enum Doors{
    case open, close
}
enum UsedCar {
    case new, used
}
enum Transmission {
    case manual, auto, robotic
}
protocol CarProt {
    var color: UIColor {get set}
    var mp3: Bool {get set}
    var transmission: Transmission {get set}
    var newOrUsed: UsedCar {get set}
    var range: Double {get set}
    var doors: Doors {get set}
    func OpenDoor()
    func CloseDoor()
}
extension CarProt {
    func ChangeRange(changRange: Double) -> Double {
        return range + changRange
    }
}
class SportCar: CarProt {
    var color: UIColor
    var mp3: Bool
    var transmission: Transmission
    var newOrUsed: UsedCar
    var range: Double
    var doors: Doors
    var turbo: Bool
    func OpenDoor() {
        doors = .open}
    func CloseDoor() {
        doors = .close
    }
    
    init(color:UIColor, mp3:Bool, transmission:Transmission, newOrUsed:UsedCar, range:Double, doors:Doors, turbo:Bool){
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.newOrUsed = newOrUsed
        self.range = range
        self.doors = doors
        self.turbo = turbo
    }
}
class TrunkCar: CarProt {
    var color: UIColor
    var mp3: Bool
    var transmission: Transmission
    var newOrUsed: UsedCar
    var range: Double
    var doors: Doors
    var trunkMaxVolume: Double
    var trunkVolume: Double
    func OpenDoor() {
        doors = .open}
    func CloseDoor() {
        doors = .close
    }
    
    init(color:UIColor, mp3:Bool, transmission:Transmission, newOrUsed:UsedCar, range:Double, doors:Doors, trunkMaxVolume:Double,trunkVolume:Double){
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.newOrUsed = newOrUsed
        self.range = range
        self.doors = doors
        self.trunkMaxVolume = trunkMaxVolume
        self.trunkVolume = trunkVolume
    }
    func loadTrunk(loadVolume: Double){
        trunkVolume = trunkVolume + loadVolume
        if trunkVolume > trunkMaxVolume {
            print("недопустимый объем загрузки");
            trunkVolume = trunkVolume - loadVolume}
        
    }
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return "пробег: \(range)"
    }
}
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "\(newOrUsed), загрузка: \(trunkVolume)"
    }
}

//Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//*Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.


struct Queue<T> {
    var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T {
        return elements.removeLast()
    }
}
var queueSportCar = Queue<SportCar>()
var queueTrunkCar = Queue<TrunkCar>()

queueSportCar.push(SportCar(color: .white, mp3: true, transmission:.auto, newOrUsed: .new, range: 0, doors: .close, turbo: true))
queueSportCar.push(SportCar(color: .black, mp3: true, transmission:.robotic, newOrUsed: .new, range: 0, doors: .close, turbo: true))
queueSportCar.push(SportCar(color: .yellow, mp3: true, transmission:.auto, newOrUsed: .used, range: 100, doors: .close, turbo: true))
queueSportCar.push(SportCar(color: .red, mp3: true, transmission:.robotic, newOrUsed: .new, range: 0, doors: .close, turbo: true))
queueTrunkCar.push(TrunkCar(color: .white, mp3: true, transmission: .auto, newOrUsed: .used, range: 10000, doors: .close, trunkMaxVolume: 1500, trunkVolume: 0))
queueTrunkCar.push(TrunkCar(color: .gray, mp3: true, transmission: .robotic, newOrUsed: .new, range: 0, doors: .close, trunkMaxVolume: 3000, trunkVolume: 0))

print(queueTrunkCar)
print(queueSportCar)


