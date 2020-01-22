//
//  DogeMarketClass.swift
//  marketWatcher
//
//  Created by jack Kelly on 4/11/18.
//  Copyright © 2018 jack Kelly. All rights reserved.
//

import Cocoa
struct TradeHistory: Codable {
    let Data: [Dataw]?

    
}
struct Dataw : Codable {
    let tradePairId : Float?
    let label : String?
    let type : String?
    let price : Float?
    let amount : Float?
    let total : Float?
    let timestamp : Float?
    
    enum CodingKeys: String, CodingKey {
        
        case tradePairId = "TradePairId"
        case label = "Label"
        case type = "Type"
        case price = "Price"
        case amount = "Amount"
        case total = "Total"
        case timestamp = "Timestamp"
    }
}
struct TradeHistory2: Codable {
    let TradePairId: Float?

}
var data1: Data = """

{"Success":true,"Message":null,"Data":[{"TradePairId":100,"Label":"DOT/BTC","Type":"Sell","Price":0.00000271,"Amount":1070.00000000,"Total":0.00289970,"Timestamp":1524062311},{"TradePairId":100,"Label":"DOT/BTC","Type":"Sell","Price":0.00000271,"Amount":4990.01996008,"Total":0.01352295,"Timestamp":1524061600},{"TradePairId":100,"Label":"DOT/BTC","Type":"Sell","Price":0.00000271,"Amount":1000.00000000,"Total":0.00271000,{"TradePairId":100,"Label":"DOT/BTC","Type":"Sell","Price":0.00000275,"Amount":927.71272727,"Total":0.00255121,"Timestamp":1523977940}],"Error":null}

""".data(using: .utf8)!

var priceArray = Array<Float>(repeating: 2.5, count: 1000)
var UrlString = ""
var curr = ""
class BaseMarketClass: NSObject {
    
    func MarketQuery(cur:String){
        print("finna fry")
        UrlString = "https://www.cryptopia.co.nz/api/GetMarketHistory/\(cur)_USDT/48"
        curr = cur
       let arr = SerializeDataToArray()
        let marketAnalysis = AnalysisClass()
        let markethighLow = marketAnalysis.GetBuySell(PriceArray: SerializeDataToArray(), Curr: cur)
        print("markethighlow val\(markethighLow.0)")
        print("mar")
    }
    
    func getDataAsAData(cur:String)-> Data{
        
        
        let url = URL(string: UrlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            //perhaps check err
            //also perhaps check response status 200 OK
            
            guard let dat2a = data else { return }
            let dataAsString = String(data: dat2a, encoding: .utf8)
            
            
            
            data1 = dat2a
           // print(dataAsString)
            }.resume()
        return data1    }
    
    func SerializeDataToArray() -> Array<Float> {
        do{
           
            var data = getDataAsAData(cur: curr)
            
            let dataAsString = String(data: data, encoding: .utf8)
            // print(dataAsString)
            let DataSerializationObject = try JSONDecoder().decode(TradeHistory.self, from: getDataAsAData(cur: curr))
            
            print("dfdfd")
            let ArrayCount = DataSerializationObject.Data?.count
            print("Array count\(ArrayCount!)")
            for i in 1..<ArrayCount! {
                print ("\(i)=\(DataSerializationObject.Data![i].price)")
                print ("\(i)=\(DataSerializationObject.Data![i].timestamp)")
                print ("\(i)=\(DataSerializationObject.Data![i].total)")
                priceArray[i] = Float(DataSerializationObject.Data![i].price!)
            }
            print(DataSerializationObject.Data![0].price)
            
            
        } catch let jsonError{
            print(jsonError)
            
        }
        return priceArray
    }
}
