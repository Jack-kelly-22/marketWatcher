//
//  DogeMarketClass.swift
//  marketWatcher
//
//  Created by jack Kelly on 4/11/18.
//  Copyright © 2018 jack Kelly. All rights reserved.
//

import Cocoa
struct Mon: Decodable {
    let result : String?
    let last : String?
    let lowestAsk : String?
    let highestBid : String?
    let percentChange : String?
    let baseVolume : String?
    let quoteVolume : String?
    let high24hr : String?
    let low24hr: String?
    
    
}
var MonDataAsAData: Data = """

{"result":"true","last":0,"lowestAsk":0,"highestBid":0,"percentChange":0,"baseVolume":0,"quoteVolume":0,"high24hr":0,"low24hr":0}

""".data(using: .utf8)!
class MonMarketClass: NSObject {
    
    func MonMarketQuery() -> Array<String> {
        //print("start start")
        SerializeDataToArray()
        //var vc = ViewController()
        //vc.DogeReInit()
        return Variables.MonStatIndex
    }
    
    func getDataAsAData()-> Data{
        
        let jsonUrlString = "http://data.gate.io/api2/1/ticker/xmr_usdt"
        let url = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            //perhaps check err
            //also perhaps check response status 200 OK
            
            guard let dat2a = data else { return }
            
            
            
            
            MonDataAsAData = dat2a
            
            }.resume()
        return MonDataAsAData
    }
    
    func SerializeDataToArray(){
        do{
            var data = getDataAsAData()
           // print("hey")
            let dataAsString = String(data: data, encoding: .utf8)
            //print(dataAsString)
            let DataSerializationObject = try JSONDecoder().decode(Mon.self, from: getDataAsAData())
            //print("last:\(DataSerializationObject.last)")
            
            Variables.MonStatIndex[0] = DataSerializationObject.last!
            Variables.MonStatIndex[1] = DataSerializationObject.percentChange!
            Variables.MonStatIndex[2] = DataSerializationObject.high24hr!
            Variables.MonStatIndex[3] = DataSerializationObject.low24hr!
            Variables.MonStatIndex[4] = DataSerializationObject.baseVolume!
           // print("Mon array:\(Variables.MonStatIndex)")
            
            
        } catch let jsonError{
            print(jsonError)
            
        }
        
    }
}
