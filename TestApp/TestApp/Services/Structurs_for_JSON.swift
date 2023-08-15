//
//  Structurs_for_JSON.swift
//  TestApp
//
//  Created by Артем on 16.07.2023.
//

import Foundation

//Categories1

struct Welcomе: Codable {
    let сategories: [Сategory]
    
}

// MARK: - Сategory
struct Сategory: Codable , Identifiable {
    var id: Int
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
}


//Categories 2


// MARK: - Welcome
struct Welcome2: Codable {
    var dishes: [Dish]
}

// MARK: - Dish
struct Dish: Codable, Identifiable {
    var id: Int
    let name: String
    let price, weight: Int
    let description: String
    let imageURL: String
    let tegs: [Teg]

    enum CodingKeys: String, CodingKey {
        case id, name, price, weight, description
        case imageURL = "image_url"
        case tegs
    }
}

enum Teg: String, Codable {
    
    case всеМеню = "Все меню"
    case сРисом = "С рисом"
    case сРыбой = "С рыбой"
    case салаты = "Салаты"
}




