//
//  ItemDB.swift
//  RealmProject
//
//  Created by Fatima Kahbi on 4/18/24.
//

import Foundation
import RealmSwift


final class ItemDB: Object {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var name: String
    @Persisted var detail: String?
    @Persisted var date: Date?
    
    init(id: UUID = UUID(), name: String, detail: String? = nil, date: Date? = nil) {
        super.init()
        self.id = id
        self.name = name
        self.detail = detail
        self.date = date
    }
    
    override init() {
        super.init()
        // Initialize the properties with default values or leave them uninitialized
        self.id = UUID()
        self.name = ""
        self.detail = nil
        self.date = nil
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension ItemDB {
    func asItem() -> Item {
        var special: SpecialContent? = nil
        if let detail, let date {
            special = SpecialContent(detail: detail, date: date)
        }
        return Item(id: id, name: name, special: special)
    }
}
