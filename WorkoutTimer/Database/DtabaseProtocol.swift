//
//  DtabaseProtocol.swift
//  WorkoutTimer
//
//  Created by Huiying Lin on 29/11/2024.
//

import Foundation

enum DatabaseChange {
    case add
    case remove
    case update
}

enum ListenerType {
    case store
}

protocol DatabaseListener: AnyObject{
    var listenerType: ListenerType {get set}
    func onTimeChange(change: DatabaseChange, time: Int)
}

protocol DatabaseProtocol: AnyObject {
    func cleanup()
    func addTime(counts: Int)
    func addListener(listener: DatabaseListener)
    func removeListener(listener: DatabaseListener)
}
