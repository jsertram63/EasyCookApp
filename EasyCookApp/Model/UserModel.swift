//
//  UserModel.swift
//  EasyCookApp
//
//  Created by Lunack on 31/10/2022.
//

import Foundation


struct UserModel :Codable ,Identifiable {
    var id = UUID()
    var name:String
    var username: String
    var password: String
    
    
}
