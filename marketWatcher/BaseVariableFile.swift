//
//  BaseVariableFile.swift
//  marketWatcher
//
//  Created by jack Kelly on 4/4/18.
//  Copyright © 2018 jack Kelly. All rights reserved.
//

import Foundation
struct Variables {
    
    static var PriceVariable:Float = 22222
    static var DogeStatIndex = [" "," "," "," "," "]
    static var BTCStatIndex = [" "," "," "," "," "]
    static var EthStatIndex = [" "," "," "," "," "]
    static var MonStatIndex = [" "," "," "," "," "]
    static var Doge1DataAsAData: Data = """
{
        "name": "Durian",
        "points": 600,
        "description": "A fruit with a distinctive scent."
    }

""".data(using: .utf8)!
    
    
}
