//
//  ReflectionRoutes.swift
//  Application
//
//  Created by José Guilherme Bestel on 23/04/20.
//

import Foundation
import Kitura
import LoggerAPI
import HeliumLogger

func initializeReflectionRoute(app :App){
    let logger = HeliumLogger(.verbose)
    Log.logger = logger
    
    app.router.post("/reflection", handler: createReflection)
    app.router.delete("/reflection", handler: removeReflection)
    app.router.put("/reflection", handler: updateReflection)
    app.router.get("/reflection", handler: getReflection)
    app.router.get("/reflection", handler: getOneReflection)
}

func createReflection(reflection :Reflection, completion :@escaping(Reflection?, RequestError?) -> Void){
    var storeReflection = reflection
    storeReflection.id = UUID().uuidString
    storeReflection.creationTime = Date()
    storeReflection.save(completion)
}

func removeReflection(id :String, completion :@escaping(RequestError?) -> Void) {
    Reflection.delete(id: id, completion)
}
func updateReflection(id :String, reflection :Reflection?, completion :@escaping(Reflection?, RequestError?) -> Void){
    reflection?.update(id: id, completion)
}

func getReflection(completion :@escaping([Reflection]?, RequestError?) -> Void) -> Void{
//    Reflection.findAll(matching: params, completion)
    Reflection.findAll(completion)
    
}

func getOneReflection(id :String, completion :@escaping(Reflection?, RequestError?) -> Void){
    Reflection.find(id: id, completion)
}

//func getEntries(params :NoteEntryParams?, completion :@escaping([NoteEntry]?, RequestError?) -> Void) -> Void{
//NoteEntry.findAll(matching: params, completion)
//}
