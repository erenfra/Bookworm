//
//  Persistence.swift
//  Bookworm
//
//  Created by Renato Oliveira Fraga on 8/6/21.
//

import CoreData
public class PersistentContainer {
        // MARK: - Define Constants / Variables
        public static var context: NSManagedObjectContext {
                return persistentContainer.viewContext
        }
        // MARK: - Initializer
        private init() {}
        // MARK: - Core Data stack
        public static var persistentContainer: NSPersistentContainer = {
                let container = NSPersistentContainer(name: "Bookworm")
                container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                        if let error = error as NSError? {
                                fatalError("Unresolved error \(error), \(error.userInfo)")
                        }
                })
                container.viewContext.automaticallyMergesChangesFromParent = true
                container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
                return container
        }()
        // MARK: - Core Data Saving support
        public static func saveContext () {
                let context = persistentContainer.viewContext
                if context.hasChanges {
                        do {
                                try context.save()
                        } catch {
                                let nserror = error as NSError
                                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                        }
                }
        }
}
