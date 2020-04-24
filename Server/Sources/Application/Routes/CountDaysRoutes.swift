//
//  CountDaysRoutes.swift
//  Application
//
//  Created by José Guilherme Bestel on 23/04/20.
//

import Foundation
import Kitura

func initializeCountDaysRoutes(app :App){
    app.router.get("/diferenca", handler: countDays)
}

func countDays(isoDate :dateParam, completion :@escaping([String : Int?]?, RequestError?)  -> Void){
    
    if(isoDate.date == nil){
        print("vazio")
        return completion(nil, .badRequest)
    }
    
    
    //String t o date
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "ddMMyyyy"
    let date = dateFormatter.date(from:isoDate.date!)!
    
    //Current date
    let today = Date()
    
    //Count days
    let calendar = Calendar.current
    let date1 = calendar.startOfDay(for: date)
    let date2 = calendar.startOfDay(for: today)
    let components = calendar.dateComponents([.day], from: date1, to: date2)
    
    //Result
    let response = ["dias entre as datas" : components.day]
    
    completion(response, nil)
}
