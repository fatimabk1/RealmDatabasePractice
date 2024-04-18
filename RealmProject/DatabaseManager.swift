//
//  DatabaseManager.swift
//  RealmProject
//
//  Created by Fatima Kahbi on 4/18/24.
//

import Foundation
import RealmSwift


final class DatabaseManager {
    private let realm: Realm
    
    init() {
        // migration boilerplate code
        let configuration = Realm.Configuration(
        schemaVersion: 1,
        migrationBlock:  { migration, oldSchemaVersion in
            if oldSchemaVersion < 1  {
                //automatic migration
            }
        })
        Realm.Configuration.defaultConfiguration = configuration
        
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initalize realm: \(error)")
        }
    }
    
    func load() -> [Item] {
        let items = realm.objects(ItemDB.self)
        print("Items pulled directly from DB")
        for item in items {
            print(item)
        }
        print("\n")
        return items.map({$0.asItem()})
    }
    
    func add(item: Item) {
        let obj = item.asItemDB()
        try! realm.write() {
            realm.add(obj)
        }
    }
    
    func delete(item: Item) {
        guard let itemInDatabase = realm.object(ofType: ItemDB.self, forPrimaryKey: item.id) else { return }
        try! realm.write() {
            realm.delete(itemInDatabase)
        }
    }
    
    func update(item: Item) {
        guard let itemInDatabase = realm.object(ofType: ItemDB.self, forPrimaryKey: item.id) else {return}
        try! realm.write() {
            itemInDatabase.name = item.name
        }
    }
    
}
