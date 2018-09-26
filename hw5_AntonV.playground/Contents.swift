import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.


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
        return "загрузка: \(trunkVolume)"
    }
}
let car1 = SportCar(color: .blue, mp3: true, transmission: .auto, newOrUsed: .new, range: 0, doors: .close, turbo: true)
car1.description
let car2 = TrunkCar(color: .black, mp3: true, transmission: .robotic, newOrUsed: .used, range: 11100, doors: .close, trunkMaxVolume: 1000, trunkVolume: 100)
car2.description
car2.loadTrunk(loadVolume: 1000)
