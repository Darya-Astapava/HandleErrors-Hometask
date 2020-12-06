import Foundation


// =================================
// MARK: - Task 3B
// =================================

/*
 Перепишите решение задачи 3 из классной работы для выполнения следующих условий:
 
 1. Ракета не может полететь, если нет экипажа. Всего экипаж - `5 человек`.
 Для работы с экипажем выполните следующие шаги:
 
 1.1. Создайте еnum Role, который будет описывать обязанности членов экипажа:
 - `Командир`,
 - `Штурман`,
 - `Механик`,
 - `Медик`,
 - `Инженер`,
 - `Повар`,
 - `Стюард/Стюардесса`
 - `Самозванец` (Imposter)
 Каждый член данного перечисления должен содержать `стаж работы` - Int.
 
 1.2. Реализуйте структуру `Член Экипажа`. Каждый член экипажа имеет:
 - имя (name),
 - роль (role)
 - возраст (age)
 
 1.3. Реализуйте свойство `Экипаж`, которое будет хратить массив членов экипажа.
 Сделайте это свойство доступным только для чтения.
 
 1.4. Для посадки каждого члена экипажа реализуйте отдельный метод.
 
 1.5. Ракета не может полететь, если при подготовке экипажа допущены ошибки.
 Реализуйте обработку следующих ошибок:
 
 - Если `Командира` и/или `Штурмана` нет на борту, даже если членов экипажа достаточно, ракета не полетит.
 Верните ошибку - какого члена экипажа не хватает.
 - Если не хватает членов экипажа, верните сообщение - сколько члено экипажа не хватает.
 - Если на борту `Самозванец` - ракету запускать нельзя! Верните ошибку!
 - Если стаж хоть одного члена экипажа менее 3х лет. Сообщите Командному центру кто это.
 
 !!! Для обработки ошибок связанных с членами экипажа, реализуйте enum `RocketStaffError` !!!
 !!! Сообщения об ошибках выводите через `NSLocalizedString` !!!
 
 
 
 2. Оборудуем ракету для перевозки пассажиров.
 Для этого:
 
 2.1. Создайте структуру `Пассажир`.
 Каждый пассажир имеет:
 - имя (name),
 - пол (gender),
 - возраст (age)
 - массу (weight)
 
 2.2. Для Ракеты реализуйте приватный массив Пассажиры, который будет принимать объекты типа Пассажир.
 
 2.3. Реализуйте методы, которые позволят сажать пассажиров на ракету, как группами, так и единичных пассажиров.
 
 2.2. Ракета может полететь, если:
 - Количество пассажиров не более 10 человек
 - Общая масса пассажиров не более 700 кг
 - Возраст каждого пассажира должен находиться в диапазоне 18 - 55 лет.
 
 2.3. Реализуйте обработку следующих ошибок:
 - Если возраст любого из пассажиров не соответсвует норме, верните ошибку, а также сообщите, какой пассажир не может полететь
 - Если количество пассажиров не соответсвует норме, верните соответствующую ошибку
 - Если масса всех пассажиров превышает норму, даже если их количество меньше установленной, верните ошибку
 
 !!! Для обработки ошибок связанных с пассажирами, реализуйте enum RocketPassengerError !!!
 !!! Сообщения об ошибках выводите через NSLocalizedString !!!
 
 
 
 3. Руководство Космопорта решило, что ракета должна перевозить грузы.
 Для этого давайте выполним следующие шаги:
 
 3.1. Реализуйте структуру `Груз`
 Каждый объект типа `Груз` должен иметь:
 - Название (subject) - String
 - Цель назначения (target) - String?
 - Свойства (properties)
 
 3.2. Для описания свойств `Груза` реализуйте `enum Properties`, где каждый элемент будет содержать:
 - массу (Float)
 - опастность груза (Bool)
 
 3.3. Реализуйте закрытое свойство `Грузовой отсек`, который будет хранить наши грузы. Доступно только для чтения.
 
 3.4. Реализуйте метод загрузки грузов в отсек.
 
 3.5. Ракета не может полететь, если не выполнены следующие нормы по перевозке грузов:
 - Если общая масса грузов превышает 1000 килограмм, верните ошибку и значение того, на сколько превышен вес.
 - Если на борту содержится хотя бы один опасный груз - при этом выведите все опасные грузы.
 - Если не указана цель назначения.
 - Если название попадает в список запрещенных.
 (Для этого можете создать произвольный список запрещаемых грузов)
 Не учитывайте регистр текста.
 
 !!! Для обработки ошибок связанных с пассажирами, реализуйте enum RocketCargoError !!!
 !!! Сообщения об ошибках выводите через NSLocalizedString !!!
 
 
 4. Предполетная подготовка. Ракета не полетит, если не выполнены требования ниже.
 Для этого придется расширить `RocketError`
 
 4.1. Вес пассажиров и груза превышает 1700 килограмм.
 4.2. Если ракета содержит топлива менее 5000 литров (не долетит), сообщите - сколько не хватает.
 4.3. Если при подготовке произошла неизвестная ошибка.
 
 !!! Сообщения об ошибках выводите через NSLocalizedString !!!
 */



// MARK: - Solution 3B
// Ваше решение можете реализовать тут

// Enums
enum Role {
    case commander(experience: Int)
    case navigator(experience: Int)
    case mechanic(experience: Int)
    case medic(experience: Int)
    case engineer(experience: Int)
    case cook(experience: Int)
    case steward(experience: Int)
    case imposter(experience: Int)
}
enum RocketStaffError: Error {
    case noCommanderOrNavigator(needed: Role)
    case notEnoughCrewMembers(needed: Int)
    case imposterOnBoard
    case experienceLessThanThreeYears(name: String)
}
enum RocketPassengerError: Error {
    case onBoardMoreThanTenPassengers
    case unacceptableAgeOfPassanger(name: String)
    case overwightPassangers
}
enum RocketCargoError: Error {
    case excessCargoWeight(weight: Float)
    case dangerousCargo(name: String)
    case unknownTarget
    case prohibitedCargo
}
enum ProhibitedCargo: String {
    case weapon
    case insects
    case animals
}
enum RocketError: Error {
    case totalWeightMoreThanPossible
    case insufficientFuel(needed: Float)
    case unknownError
}

// Structs
struct CrewMember {
    var name: String
    var role: Role
    var age: Int
}
struct Passenger {
    enum Sex {
        case male
        case female
    }
    
    var name: String
    var sex: Sex
    var age: Int
    var weight: Float
}
struct Cargo {
    enum Properties {
        case special(weight: Float, dangerous: Bool)
        case regular(weight: Float, dangerous: Bool)
    }
    
    var subject: String
    var target: String?
    var properties: Properties
}

// Variable
private(set) var crew: [CrewMember] = []
private var passengerData: [Passenger] = []
private(set) var cargoHold: [Cargo] = []

// Methods
func boardingCrewMember(member: CrewMember) {
    crew.append(member)
}

func boardingOnePassenger(passenger: Passenger) {
    passengerData.append(passenger)
}

func boardingGroupOfPassengers(group: [Passenger]) {
    passengerData.append(contentsOf: group)
}

func addCargoToHold(cargo: Cargo) {
    cargoHold.append(cargo)
}

func startRocket(isFuelOnBoard: Float) throws {
    
    //Если `Командира` и/или `Штурмана` нет на борту, даже если членов экипажа достаточно, ракета не полетит.
    var arrayWithRole: [Role] = []
    for man in crew {
        arrayWithRole.append(man.role.self)
    }
    // Перебираю массив ролей на наличие командира и навигатора
    var hasCommander: Bool = false
    var hasNavigator: Bool = false
    for man in arrayWithRole {
        switch man {
        case .commander(experience: _):
            hasCommander = true
        case .navigator(experience: _):
            hasNavigator = true
        default:
            continue
        }
    }
    if hasNavigator == false {
        throw RocketStaffError.noCommanderOrNavigator(needed: Role.navigator(experience: 3))
    } else if hasCommander == false {
        throw RocketStaffError.noCommanderOrNavigator(needed: Role.commander(experience: 3))
    }
    
    // Делаю по условию задачи исходя из заданных ошибок, хотя на мой взгляд нужно обработать еще ситуацию когда членов экипажа больше 5.
    guard crew.count >= 5 else { throw RocketStaffError.notEnoughCrewMembers(needed: 5 - crew.count) }
    
    //- Если на борту `Самозванец` - ракету запускать нельзя! Верните ошибку!
    for man in arrayWithRole {
        switch man {
        case .imposter(experience: _):
            throw RocketStaffError.imposterOnBoard
        default:
            continue
        }
    }
    
    //- Если стаж хоть одного члена экипажа менее 3х лет. Сообщите Командному центру кто это.
    for man in crew {
        switch man.role {
        case .commander(experience: 0..<3),
             .cook(experience: 0..<3),
             .engineer(experience: 0..<3),
             .mechanic(experience: 0..<3),
             .medic(experience: 0..<3),
             .navigator(experience: 0..<3),
             .steward(experience: 0..<3):
            throw RocketStaffError.experienceLessThanThreeYears(name: man.name)
        default:
            continue
        }
    }
    
    // Количество пассажиров не более 10
    guard passengerData.count <= 10 else { throw RocketPassengerError.onBoardMoreThanTenPassengers }
    
    // Общая масса пассажиров не более 700 кг
    var totalPassengersWeight: Float = 0
    passengerData.forEach() { totalPassengersWeight += $0.weight }
    guard totalPassengersWeight <= 700 else { throw RocketPassengerError.overwightPassangers }
    
    // Возраст каждого пассажира должен находиться в диапазоне 18 - 55 лет.
    for man in passengerData {
        guard man.age >= 18 || man.age <= 55 else { throw RocketPassengerError.unacceptableAgeOfPassanger(name: man.name) }
    }
    
    //  Если общая масса грузов превышает 1000 килограмм, верните ошибку и значение того, на сколько превышен вес.
    
    var totalCargoWeight: Float = 0
    cargoHold.forEach() {
        switch $0.properties {
        case let .regular(weight, _):
            totalCargoWeight += weight
        case let .special(weight, _):
            totalCargoWeight += weight
        }
    }
    guard totalCargoWeight <= 1000 else { throw RocketCargoError.excessCargoWeight(weight: totalCargoWeight - 1000) }
    
    //     - Если на борту содержится хотя бы один опасный груз - при этом выведите все опасные грузы.
    var dangerousCargo: Bool = false
    var dangerousCargoSubject: String = ""
    cargoHold.forEach() {
        switch $0.properties {
        case let .regular(_, cargo):
            if cargo == true {
                dangerousCargo = true
                dangerousCargoSubject = $0.subject
            }
        case let .special(_, cargo):
            if cargo == true {
                dangerousCargo = true
                dangerousCargoSubject = $0.subject
            }
        }
    }
    guard dangerousCargo != true else { throw RocketCargoError.dangerousCargo(name: dangerousCargoSubject) }
    
    //     - Если не указана цель назначения.
    for item in cargoHold {
        guard let _: String = item.target else {
            throw RocketCargoError.unknownTarget
        }
    }
    
    //     - Если название попадает в список запрещенных.
    for item in cargoHold {
        switch item.subject.lowercased() {
        case ProhibitedCargo.animals.rawValue, ProhibitedCargo.insects.rawValue, ProhibitedCargo.weapon.rawValue:
            throw RocketCargoError.prohibitedCargo
        default:
            continue
        }
    }
    
    //  4.1. Вес пассажиров и груза превышает 1700 килограмм.
    let totalWeight: Float = totalCargoWeight + totalPassengersWeight
    guard  totalWeight <= 1700 else {
        throw RocketError.totalWeightMoreThanPossible
    }
    
    //       4.2. Если ракета содержит топлива менее 5000 литров (не долетит), сообщите - сколько не хватает.
    if isFuelOnBoard < 5000 {
        throw RocketError.insufficientFuel(needed: 5000 - isFuelOnBoard)
    }
    
    print("The rocket is ready to start")
}

// Extensions
extension RocketStaffError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noCommanderOrNavigator(let man):
            return NSLocalizedString("\(man) is not on the board",
                                     comment: "")
        case .notEnoughCrewMembers(let count):
            return NSLocalizedString("On the board isn't enough crew members. Nedded \(count) member/members",
                                     comment: "")
        case .imposterOnBoard:
            return NSLocalizedString("Attencion! The imposter is on the board",
                                     comment: "")
        case .experienceLessThanThreeYears(let name):
            return NSLocalizedString("\(name) has less than three years experience",
                                     comment: "")
        }
    }
}

extension RocketPassengerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unacceptableAgeOfPassanger(let name):
            return NSLocalizedString(name + " has an unacceptable age",
                                     comment: "")
        case .onBoardMoreThanTenPassengers:
            return NSLocalizedString("Count of passengers on the board is more than 10", comment: "")
        case .overwightPassangers:
            return NSLocalizedString("Total passangers wight is more than 700 kg", comment: "")
        }
    }
}

extension RocketCargoError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .excessCargoWeight(let weight):
            return NSLocalizedString("Excess of cargo Weight by \(weight) kg",
                                     comment: "")
        case .dangerousCargo(let name):
            return NSLocalizedString("Dangerous cargo is \(name)",
                                     comment: "")
        case .prohibitedCargo:
            return NSLocalizedString("Prohibited cargo",
                                     comment: "")
        case .unknownTarget:
            return NSLocalizedString("Unknown target",
                                     comment: "")
        }
    }
}

extension RocketError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .insufficientFuel(let needed):
            return NSLocalizedString("The rocket needs \(needed)l fuel else",
                                     comment: "")
        case .totalWeightMoreThanPossible:
            return NSLocalizedString("Total weight of passengers and cargo is more than possible",
                                     comment: "")
        case .unknownError:
            return NSLocalizedString("Attencion! Unknown error",
                                     comment: "")
        }
    }
}

// Добавляем команду через метод посадки
boardingCrewMember(member: .init(name: "Mike", role: .commander(experience: 30), age: 50))
boardingCrewMember(member: .init(name: "Stiv", role: .navigator(experience: 10), age: 35))
boardingCrewMember(member: .init(name: "Katya", role: .medic(experience: 15), age: 40))
boardingCrewMember(member: .init(name: "Migel", role: .engineer(experience: 18), age: 38))
boardingCrewMember(member: .init(name: "Jake", role: .mechanic(experience: 17), age: 37))

// Добавляем пассажиров
boardingOnePassenger(passenger: .init(name: "Vik", sex: .female, age: 25, weight: 48))
boardingOnePassenger(passenger: .init(name: "Luck", sex: .male, age: 38, weight: 80))
boardingOnePassenger(passenger: .init(name: "Vik", sex: .female, age: 25, weight: 90))
boardingOnePassenger(passenger: .init(name: "Luck", sex: .male, age: 38, weight: 100))

// Добавляем груз
addCargoToHold(cargo: .init(subject: "food", target: "for personal", properties: .regular(weight: 500, dangerous: false)))
addCargoToHold(cargo: .init(subject: "equipment", target: "research", properties: .special(weight: 400, dangerous: false)))

do {
    try  startRocket(isFuelOnBoard: 4976)
} catch {
    print(error.localizedDescription)
}



// =================================
// MARK: - Task 4B
// =================================

/*
 Перепишите решение задачи 4 из классной работы для выполнения следующих условий:
 
 1. Username пользователя должен быть длиной не менее 8 символов и не длиннее 20ти. Верните соответствующее сообщение.
 
 2. Username должен содержать хотя бы одну Заглавную букву, хотя бы одну цифру и символ "-".
 Укажите пользователю, какой символ в имени не подходит.
 
 3. Username не может состоять только из цифр. Верните соответствующее сообщение.
 
 4. Username не может состоять только из Заглавных букв. Верните соответствующее сообщение.
 
 5. Символы, кроме "-", запрещены! Верните соответствующее сообщение.
 
 6. Username не может начинаться с символа "-" или цифры. Верните соответствующее сообщение.
 
 7. Username не может заканчиваться на символ "-". Верните соответствующее сообщение.
 
 Для каждой конкретной ситуации реазуйте возврат ошибки, в понятном и очевидном виде для пользователя.
 Воспользуйтесь `NSLocalizedString`
 
 */



// MARK: - Solution 4B
// Ваше решение можете реализовать тут


enum ValidationError: Error {
    case tooShort
    case tooLong
    case incorrectSymbol(Character)
    case needUppercaseLetter
    case needNumeral
    case needHyphen
    case doNotUseOnlyNumbers
    case doNotUseOnlyUppercaseLetters
    case incorrectFirstSymbol(Character)
    case incorrectLastSymbol(Character)
}

func validate(username: String) throws {
    guard username.count > 7 else { throw ValidationError.tooShort }
    guard username.count < 20 else { throw ValidationError.tooLong }
    
    var letter: Bool = false
    var number: Bool = false
    var hyphen: Bool = false
    var capitalLetter: Bool = false
    
    try Array(username).forEach {
        if $0.isSymbol && $0 != "-" {
            throw ValidationError.incorrectSymbol($0)
        }
    }
    
    Array(username).forEach {
        if $0.isUppercase { capitalLetter = true }
        else if $0.isNumber { number = true }
        else if $0 == "-" { hyphen = true }
        else if $0.isLetter { letter = true }
    }
    
    guard number == true else { throw ValidationError.needNumeral }
    guard hyphen == true else { throw ValidationError.needHyphen }
    guard capitalLetter == true else { throw ValidationError.needUppercaseLetter }
    if (number == true && letter == false) && (hyphen == false && capitalLetter == false) {
        throw ValidationError.doNotUseOnlyNumbers
    }
    
    if (number == false && letter == false) && (hyphen == false && capitalLetter == true) {
        throw ValidationError.doNotUseOnlyUppercaseLetters
    }
    
    if let firstChar: Character = Array(username).first {
        if firstChar == "-" || firstChar.isNumber {
            throw ValidationError.incorrectFirstSymbol(firstChar)
        }
    }
    
    if let lastChar: Character = Array(username).last {
        if lastChar == "-" {
            throw ValidationError.incorrectLastSymbol(lastChar)
        }
    }
    
    print("Username is OK")
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .tooShort:
            return NSLocalizedString("Your username needs to be at least 4 characters long",
                                     comment: "")
        case .tooLong:
            return NSLocalizedString("Your username needs to be at least less than 15 characters long",
                                     comment: "")
        case .incorrectSymbol(let symbol):
            let formatedString = NSLocalizedString("Your username can't contain the character '%@'",
                                                   comment: "")
            return String(format: formatedString, String(symbol))
        case .doNotUseOnlyNumbers:
            return NSLocalizedString("You cannot use only numbers. You must use letters, at least one capital letter, one numeral and one hyphen",
                                     comment: "")
        case .doNotUseOnlyUppercaseLetters:
            return NSLocalizedString("You cannot use only capital letter. You must use letters, at least one capital letter, one numeral and one hyphen",
                                     comment: "")
        case .incorrectFirstSymbol(let symbol):
            let formatedString = NSLocalizedString("Your username can't start with '%@'",
                                                   comment: "")
            return String(format: formatedString, String(symbol))
        case .incorrectLastSymbol(let symbol):
            let formatedString = NSLocalizedString("Your username can't finish with '%@'",
                                                   comment: "")
            return String(format: formatedString, String(symbol))
        case .needHyphen:
            return NSLocalizedString("You must use at least one hyphen",
                                     comment: "")
        case .needNumeral:
            return NSLocalizedString("You must use at least one numeral",
                                     comment: "")
        case .needUppercaseLetter:
            return NSLocalizedString("You must use at least one capital letter",
                                     comment: "")
        }
    }
}

do {
    try validate(username: "Nagibator-7")
} catch {
    print(error.localizedDescription)
}

