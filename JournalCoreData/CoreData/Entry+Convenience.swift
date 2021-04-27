//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by anthony byrd on 4/26/21.
//

import CoreData

extension Entry {
    @discardableResult convenience init(title: String, timeStamp: Date = Date(), bodyText: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.timeStamp = timeStamp
        self.bodyText = bodyText
    }
}//End of extension
