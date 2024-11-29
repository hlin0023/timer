//
//  CoreDataController.swift
//  WorkoutTimer
//
//  Created by Huiying Lin on 29/11/2024.
//

import Foundation
import UIKit
import CoreData

class CoreDataController: NSObject, DatabaseProtocol, NSFetchedResultsControllerDelegate {

    var listeners = MulticastDelegate<DatabaseListener>()
    var persistentContainer: NSPersistentContainer
    
    // Fetched Results Controllers
    var teamHeroesFetchedResultsController: NSFetchedResultsController<Time>?
    
    override init() {
        // Load the Core Data Stack
        persistentContainer = NSPersistentContainer(name: "times")
        persistentContainer.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        super.init()

    }
    
    func saveContext() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                fatalError("Failed to save to CoreData: \(error)")
            }
        }
    }
    
    func cleanup() {
        saveContext()
    }
    
  
    func addTime(counts: Int){
        let time = NSEntityDescription.insertNewObject(forEntityName: "Time", into: persistentContainer.viewContext) as! Time
        time.timeins = Int64(counts)
        
    }
    
    
    func addListener(listener: DatabaseListener) {
        listeners.addDelegate(listener)
    }
        
    func removeListener(listener: DatabaseListener) {
        listeners.removeDelegate(listener)
    }
    
    // MARK: - Fetched Results Controller Protocol Functions
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {

    }
    

}
