//
//  PriceSaveDataClass.swift
//  marketWatcher
//
//  Created by jack Kelly on 3/26/18.
//  Copyright © 2018 jack Kelly. All rights reserved.
//

import Cocoa

class PriceSaveDataClass: NSObject {
    
        static let sharedInstance = PriceSaveDataClass()
        var score = 0
        var highScore = 0
        var can = true
    func saveValue(key: String, data: Float){
            
            let defaults = UserDefaults.standard
            let currentPriceSave = defaults.set(data, forKey: key)
            
            // let defaults = UserDefaults.standard
            // var savedScore: Int = defaults.integer(forKey: "highscore")
            
            
            
            
            print("scoreSaved")
            // print(highScore)
            // To get the saved score
            
            
        
    }

}
