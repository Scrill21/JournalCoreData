//
//  EntryController.swift
//  JournalCoreData
//
//  Created by anthony byrd on 4/26/21.
//

import CoreData

class EntryController {
    
    //MARK: - SharedInstance and Properties
    static let sharedInstance = EntryController()
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        
        return request
    }()
    
    //MARK: - CRUD Methods
    func createEntry(title: String, body: String) {
        let newEntry = Entry(title: title, bodyText: body)
        entries.append(newEntry)
        
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.entries = entries
    }
    
    func updateEntry(_ entry: Entry) {
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(title: Entry, body: Entry) {
    }
}//End of class
