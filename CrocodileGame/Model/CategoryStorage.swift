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
        categories.forEach { category in
            if category.selected {
                container.append(category.name)
                
            }
        }
        let randomized = Array(Set(container))
        return randomized
    }
    
    var categories = [
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
