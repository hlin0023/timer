//
//  Time+CoreDataProperties.swift
//  WorkoutTimer
//
//  Created by Huiying Lin on 29/11/2024.
//
//

import Foundation
import CoreData


extension Time {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Time> {
        return NSFetchRequest<Time>(entityName: "Time")
    }

    @NSManaged public var timeins: Int64

}

extension Time : Identifiable {

}
