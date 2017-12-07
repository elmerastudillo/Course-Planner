//
//  CoreDataStack.swift
//  Course-Planner
//
//  Created by Elmer Astudillo on 12/6/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import CoreData

public final class CoreDataStack
{
    static let instance = CoreDataStack()
    
    // Create a persistent container
    private lazy var persistanceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer (
            name: "Course-Planner"
            )
        container.loadPersistentStores(completionHandler: { (coureDescription, error) in
            if let error = error
            {
                fatalError("Unresolved error \(error), \(String(describing: error._userInfo))")
            }
        })
        return container
    }()
    
    // Access coredata using the main thread
    lazy var viewContext : NSManagedObjectContext = {
        let viewContext = persistanceContainer.viewContext
        return viewContext
    }()
    
    lazy var privateContext : NSManagedObjectContext = {
        let privateCon = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateCon.persistentStoreCoordinator = persistanceContainer.persistentStoreCoordinator
        return privateCon
    }()
    
    func save(context: NSManagedObjectContext)
    {
        if context.hasChanges
        {
            do {
                try context.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved error \(error)")
            }
        }
    }
    
    
    
    
}
