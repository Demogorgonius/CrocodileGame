//
//  CategoryStorage.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 20.04.2023.
//

import Foundation

final class CategoryStorage {
    static var shared = CategoryStorage()
    
    public func getWordsForGame() -> [String] {
        var container = [String]()
        all.forEach { category in
            if category.selected {
                category.names.forEach { word in
                    container.append(word)
                }
            }
        }
        let randomized = Array(Set(container))
        return randomized
    }
    
    public func changeSelection(name: String, isSelected: Bool) {
        let newCategories = all.map { category -> Category in
            if category.name == name {
                var modify = category
                modify.selected = isSelected
                return modify
            } else {
                return category
            }
        }
        all = newCategories
    }
    
    var all = [
        Category(
            name: "Профессии",
            avatar: "👨🏻‍🔬",
            selected: true,
            background: CrocodileColors.orangeButton,
            names: ["Инженер", "Механик", "Агроном", "Сантехнический работник", "Медбрат", "Переводчик", "Хирург", "Крупье", "Пожарный", "Полицейский", "Шофер", "Врачпсихолог", "Лифтер", "Адвокат", "Прокурoр", "Врач-акушер", "Художник", "Архитектор", "Кассир", "Посол"]),
        Category(
            name: "Животные",
            avatar: "🐻",
            selected: false,
            background: CrocodileColors.purple,
            names: ["Слон", "Собака", "Пингвин", "Лиса", "Змея", "Сурикат", "Кузнечик", "Страус", "Крыса", "Ленивец", "Енот", "Лев", "Кошка", "Жираф", "Кабан", "Тюлень", "Бегемот", "Дельфин", "Лошадь", "Журавль"]),
        Category(
            name: "Транспорт",
            avatar: "🚙",
            selected: false,
            background: CrocodileColors.pink,
            names: ["Танк", "Машина", "Велосипед", "Самокат", "Коньки", "Скейт-борд", "Самолет", "Беговел", "Дирижабль", "Метла", "Летающая тарелка", "Ковер-самолет", "Собачья упряжка", "Поезд", "Вертолет", "Корабль", "Лыжи", "Сани", "Карета", "Паланкин"]),
        Category(
            name: "Персонажи",
            avatar: "🤴🏻",
            selected: false,
            background: CrocodileColors.greenButton,
            names: ["Шрек", "Микки Маус", "Бэт-мэн", "Чебурашка", "Карлсон", "Человек паук", "Халк", "Гарри Поттер", "Незнайка", "Капитан Джек Воробей", "Дональд Дак", "Супермэн", "Леший", "Дед Мороз", "Крокодил Гена", "Доктор Айболит", "Буратино", "Чипполино", "Джеймс Бонд", "Шерлок Холмс"])
        ]
}
