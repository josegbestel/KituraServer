//
//  UserAuth.swift
//  Application
//
//  Created by José Guilherme Bestel on 17/04/20.
//

import Foundation
import SwiftKueryORM
import CredentialsHTTP

public struct UserAuth:Model {
    public var id :String
    public let password :String
    
}
