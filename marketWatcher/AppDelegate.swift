//
//  AppDelegate.swift
//  marketWatcher
//
//  Created by jack Kelly on 2/25/18.
//  Copyright © 2018 jack Kelly. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
var BTCusdt: URL = URL(string: "http://data.gate.io/api2/1/ticker/btc_usdt")!
var priceFetch1 = PriceFetcher()

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

