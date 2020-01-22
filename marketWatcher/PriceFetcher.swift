//
//  PriceFetcher.swift
//  marketWatcher
//
//  Created by jack Kelly on 2/25/18.
//  Copyright © 2018 jack Kelly. All rights reserved.
//

import Cocoa

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    

}
struct BTC1: Decodable {
    let result : String?
    let last : Float!
    let lowestAsk : Float?
    let highestBid : Float?
    let percentChange : Float?
    let baseVolume : Float?
    let quoteVolume : Float?
    let high24hr : Float?
    
   
}

class PriceFetcher: NSObject {
   
    
    
    


    func getBulkDataAsStringFrom2() -> Float{
        var CurrentPrice: Float = 0
    let jsonUrlString = "http://data.gate.io/api2/1/ticker/btc_usdt"
    guard let url = URL(string: jsonUrlString) else { return 0 }
    
    URLSession.shared.dataTask(with: url) { (data, response, err) in
        //perhaps check err
        //also perhaps check response status 200 OK
        
        guard let dat2a = data else { return }
        
     
        do {
            
            
            let courses2 = try JSONDecoder().decode(BTC.self, from: dat2a)
            
            
            
            
            //print("HIGH2424 \(CurrentPrice)")
                        
        } catch let jsonErr {
            //print("Error serializing json:", jsonErr)
        }
        
        
        
        }.resume()

    //print("currentPrice var \(CurrentPrice)")
        let newInstance = SavePriceClass()
        newInstance.cachePrice(Price: CurrentPrice)
        //print("about to return price of \(CurrentPrice)" )
    return Variables.PriceVariable
}

}
        
    
    
    

