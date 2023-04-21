//
//  Category.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

class Category {
    let name: String
    let avatar: Character
    var selected: Bool
    let background: CrocodileColors
    var names: [String]
    
    init(name: String, avatar: Character, selected: Bool, background: CrocodileColors, names: [String]) {
        self.name = name
        self.avatar = avatar
        self.selected = selected
        self.background = background
        self.names = names
    }
}
