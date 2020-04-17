//
//  EntryRoutes.swift
//  Application
//
//  Created by José Guilherme Bestel on 16/04/20.
//

import Foundation
import KituraContracts
import LoggerAPI

//var entries : [NoteEntry] = []

func initializeEntryRoutes(app :App){
    app.router.post("/entries", handler: addEntry)
    app.router.get("/entries", handler: getEntries)
    app.router.delete("/entries", handler: deleteEntry)
    app.router.put("/entries", handler: modifyEntry)
    app.router.get("/entries", handler: getOneEntry)
}

func addEntry(entry :NoteEntry, completion :@escaping(NoteEntry?,RequestError?) -> Void){
    var storeEntry = entry
    storeEntry.id = UUID().uuidString
    storeEntry.save(completion)
    
//    entries.append(storeEntry)
//    completion(storeEntry,nil)
    
}

func deleteEntry(id :String, completion :@escaping(RequestError?) -> Void){
    NoteEntry.delete(id: id, completion)
//    guard let index = entries.firstIndex(where: {$0.id == id}) else {
//        return completion(.notFound)
//    }
//    entries.remove(at: index)
//    completion(nil)
}

func getEntries(params :NoteEntryParams?, completion :@escaping([NoteEntry]?, RequestError?) -> Void) -> Void{
    NoteEntry.findAll(matching: params, completion)
    
//    guard let params = params else{
//        return completion(entries,nil)
//    }
//    let filteredEntries = entries.filter{$0.label == params.label}
//    completion(filteredEntries, nil)
    
}

func modifyEntry(id :String, entry :NoteEntry, completion :@escaping(NoteEntry?, RequestError?) -> Void){
    entry.update(id: id, completion)
}

func getOneEntry(id :String, completion :@escaping(NoteEntry?, RequestError?) -> Void){
    NoteEntry.find(id: id, completion)
}
