//
//  AuthRoutes.swift
//  Application
//
//  Created by José Guilherme Bestel on 17/04/20.
//

import Foundation
import Credentials
import CredentialsHTTP


func initializeBasicAuth(app :App){
    let credentials = Credentials()
    let basicCredentials = CredentialsHTTPBasic(verifyPassword: {
        username, password, callback in
        
        UserAuth.find(id: username){ userAuth, error in
            if let user = userAuth{
                if password == user.password{
                    callback(UserProfile(id: username, displayName: username, provider: "HTTPBasic"))
                }else{
                    callback(nil)
                }
            }
            
        }
        
        
    })
    credentials.register(plugin: basicCredentials)
    app.router.all("/entries", middleware: credentials)
}
