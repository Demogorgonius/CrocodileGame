//
//  Category.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

struct Category {
    let name: String
    let avatar: Character
    var selected: Bool
    let background: CrocodileColors
    var names: [String]
}

struct CategoryStorage {
    let allCategories = [
        Category(
            name: "Профессии",
            avatar: #imageLiteral(resourceName: "professions3"),
            selected: false,
            background: CrocodileColors.orangeButton,
            names: ["Инженер", "Механик", "Агроном", "Сантехнический работник", "Медбрат", "Переводчик", "Хирург", "Крупье", "Пожарный", "Полицейский", "Шофер", "Врачпсихолог", "Лифтер", "Адвокат", "Прокурoр", "Врач-акушер", "Художник", "Архитектор", "Кассир", "Посол"]),
        Category(
            name: "Животные",
            avatar: #imageLiteral(resourceName: "animals1"),
            selected: false,
            background: CrocodileColors.purple,
            names: ["Слон", "Собака", "Пингвин", "Лиса", "Змея", "Сурикат", "Кузнечик", "Страус", "Крыса", "Ленивец", "Енот", "Лев", "Кошка", "Жираф", "Кабан", "Тюлень", "Бегемот", "Дельфин", "Лошадь", "Журавль"]),
        Category(
            name: "Средства передвижения",
            avatar: #imageLiteral(resourceName: "cars1"),
            selected: false,
            background: CrocodileColors.pink,
            names: ["Танк", "Машина", "Велосипед", "Самокат", "Коньки", "Скейт-борд", "Самолет", "Беговел", "Дирижабль", "Метла", "Летающая тарелка", "Ковер-самолет", "Собачья упряжка", "Поезд", "Вертолет", "Корабль", "Лыжи", "Сани", "Карета", "Паланкин"]),
        Category(
            name: "Персонажи",
            avatar: #imageLiteral(resourceName: "characters1"),
            selected: false,
            background: CrocodileColors.greenButton,
            names: ["Шрек", "Микки Маус", "Бэт-мэн", "Чебурашка", "Карлсон", "Человек паук", "Халк", "Гарри Поттер", "Незнайка", "Капитан Джек Воробей", "Дональд Дак", "Супермэн", "Леший", "Дед Мороз", "Крокодил Гена", "Доктор Айболит", "Буратино", "Чипполино", "Джеймс Бонд", "Шерлок Холмс"])
        ]
}
