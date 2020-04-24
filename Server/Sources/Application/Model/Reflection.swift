//
//  Reflection.swift
//  Application
//
//  Created by José Guilherme Bestel on 23/04/20.
//

import Foundation
import KituraContracts
import SwiftKueryORM

struct ReflectionParams : QueryParams{
//    var id :String?
    var text :String?
//    var time :Date?
}

struct Reflection : Model {
    var id :String?
    var text :String
    var creationTime :Date?
}
