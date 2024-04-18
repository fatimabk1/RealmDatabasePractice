//
//  ContentViewModel.swift
//  RealmProject
//
//  Created by Fatima Kahbi on 4/18/24.
//

import Foundation


final class ContentViewModel: ObservableObject {
    @Published var items = [Item]()
    private let db = DatabaseManager()
    var count = 0
    
    func onAppear() {
        self.load()
    }
    
    func load() {
        self.items = db.load()
    }
    
    func add() {
        db.add(item: Item(name: "Item #\(count)"))
        count += 1
        load()
    }
    
    func delete(item: Item){
        db.delete(item: item)
        load()
    }
    
    func update(item: Item){
        var updatedItem = item
        updatedItem.name = updatedItem.name + " UPDATED"
        db.update(item: updatedItem)
        load()
    }
    
}
