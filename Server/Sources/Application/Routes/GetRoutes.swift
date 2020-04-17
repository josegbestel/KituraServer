//
//  GetRoutes.swift
//  Application
//
//  Created by José Guilherme Bestel on 16/04/20.
//

import Foundation
import KituraContracts
import LoggerAPI

func initializeGetRoutes(app :App){
    app.router.get("/hello"){
        request, response, next in
        response.headers["Content-Type"] = "text/txt"
        response.send("HELLO KITURA")
        next()
        
    }
}
