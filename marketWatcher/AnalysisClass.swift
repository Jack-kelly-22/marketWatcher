//
//  AnalysisClass.swift
//  marketWatcher
//
//  Created by jack Kelly on 5/29/18.
//  Copyright © 2018 jack Kelly. All rights reserved.
//

import Cocoa

class AnalysisClass: NSObject {
    var  sum:Float = 0
    var Mean:Float = 0
    func GetBuySell(PriceArray: Array<Float>, Curr: String) -> (Float, Float)
    {
        print(PriceArray.count)
        
       return (MeanPrice(PriceArray: PriceArray), 0)
    }
    func MeanPrice(PriceArray: Array<Float>) ->  Float {
       
        for i in 1..<PriceArray.count{
            
            sum = sum + Float(PriceArray[i])
            
        }
        Mean = sum/Float(PriceArray.count)
        print(Mean)
        return Mean
        
        
    }
    
    
}
