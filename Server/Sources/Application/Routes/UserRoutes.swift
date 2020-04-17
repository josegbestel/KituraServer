//
//  UserRoutes.swift
//  Application
//
//  Created by José Guilherme Bestel on 17/04/20.
//

import Foundation
import LoggerAPI
import Kitura

func initializeUserRoutes(app :App){
    app.router.post("/user", handler: addUser)
    app.router.delete("/user", handler: deleteUser)
    
}

func addUser(user :UserAuth, completion :@escaping(UserAuth?, RequestError?) -> Void){
    user.save(completion)
}

func deleteUser(id :String, completion :@escaping(RequestError?) -> Void){
    UserAuth.delete(id: id, completion)
}
