//
//  UserSettings.swift
//  DefaultsProject
//
//  Created by Алексей Пархоменко on 17.03.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: String
    let email: String
    
}

final class UserSettings {
    private enum SettingsKeys: String {
        case userName
        case userModel
        
    }
    
    static var userModel: UserModel? {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.userModel.rawValue) as? Data, let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UserModel else { return nil}
            return decodedModel
            
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userModel.rawValue
            if let userModel = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: userModel, requiringSecureCoding: false) {
                    print("value: \(userModel) was added to key \(key)")
                    defaults.set(savedData, forKey: key)
                    
                } else {
                    defaults.removeObject(forKey: key )
                    
                }
                
            }
            
        }
        
    }
    
    static var userName: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userName.rawValue
            if let name = newValue {
                print("value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
                
            } else {
                defaults.removeObject(forKey: key)
                
            }
            
        }
        
    }
    
}
