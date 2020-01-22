//
//  SavePriceClass.swift
//  marketWatcher
//
//  Created by jack Kelly on 3/26/18.
//  Copyright © 2018 jack Kelly. All rights reserved.
//

import Cocoa

class SavePriceClass: NSObject {
    func cachePrice(Price: Float){
        print("current price start")
        print(Price)
        
        UserDefaults.standard.set( Price, forKey: "highscore")
        
        
    }
}
