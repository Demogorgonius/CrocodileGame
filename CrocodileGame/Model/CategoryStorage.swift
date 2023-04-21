//
//  CategoryStorage.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 20.04.2023.
//

import Foundation

class CategoryStorage {
    static var shared = CategoryStorage()
    
    public func getWordsForGame() -> [String] {
        var container = [String]()
        all.forEach { category in
            if category.selected {
                container.append(category.name)
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
        print("all", all)
    }
    
    var all = [
        Category(name: "Животные",
                 avatar: "🐸",
                 selected: true,
                 background: .purple,
                 names: [""]),
        Category(name: "Еда",
                 avatar: "🍔",
                 selected: true,
                 background: .yellow,
                 names: [""]),
        Category(name: "Личности",
                 avatar: "🤠",
                 selected: true,
                 background: .blue,
                 names: [""]),
        Category(name: "Хобби",
                 avatar: "🎬",
                 selected: true,
                 background: .red,
                 names: [""])
    ]
}
