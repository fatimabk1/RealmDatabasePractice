//
//  Item.swift
//  RealmProject
//
//  Created by Fatima Kahbi on 4/18/24.
//

import Foundation


struct Item {
    let id: UUID
    var name: String
    var special: SpecialContent?
    
    init(id: UUID = UUID(), name: String, special: SpecialContent? = nil) {
        self.id = id
        self.name = name
        self.special = special
    }
}

struct SpecialContent {
    var detail: String
    var date: Date
    
    init(detail: String, date: Date = Date()) {
        self.detail = detail
        self.date = date
    }
}

extension Item {
    func asItemDB() -> ItemDB {
        return ItemDB(id: id, name: name, detail: special?.detail, date: special?.date)
    }
}
