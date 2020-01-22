//
//  ViewController.swift
//  marketWatcher
//
//  Created by jack Kelly on 2/25/18.
//  Copyright © 2018 jack Kelly. All rights reserved.
//

import Cocoa
import Charts
class ViewController: NSViewController {

    var ETHArray = [" "," "," "," "," "]
    var MonArray = [" "," "," "," "," "]
    var BTCArray = [" "," "," "," "," "]
    var dogeArray = [" "," "," "," "," "]
    var testArray = [" "," "," "," "," "]
    var lineChartEntry = [ChartDataEntry]()
    @IBOutlet weak var BTCtext: NSTextField!
    
    
    
    
    //BTC StoryBoardValues
    @IBOutlet weak var BTCPriceLabel: NSTextField!
    @IBOutlet weak var BTC24HourChangeLabel: NSTextField!
    @IBOutlet weak var BTC24HourHighLabel: NSTextField!
    @IBOutlet weak var BTC24HourLowLabel: NSTextField!
    @IBOutlet weak var BTCVolumeLabel: NSTextField!
    @IBOutlet var LineChartView1: LineChartView!
    
    //Doge StoryBoardValues
    @IBOutlet weak var DogePriceLabel: NSTextField!
    @IBOutlet weak var Doge24HourChangeLabel: NSTextField!
    @IBOutlet weak var Doge24HourHighLabel: NSTextField!
    
    @IBOutlet weak var Doge24HourLowLabel: NSTextField!
    @IBOutlet weak var DogeVolumeLabel: NSTextField!
    
    //Eth StoryBoardValues
    @IBOutlet weak var EthPriceLabel: NSTextField!
    @IBOutlet weak var Eth24HourChangeLabel: NSTextField!
    @IBOutlet weak var Eth24HourHigh: NSTextField!
    @IBOutlet weak var Eth24HourLowLabel: NSTextField!
    @IBOutlet weak var EthVolumeLabel: NSTextField!
    @IBOutlet weak var Mon24HourLowLabel: NSTextField!
    
    //Monero StoryBoardValues
    @IBOutlet weak var MonPriceLabel: NSTextField!
    @IBOutlet weak var Mon24HourChangeLabel: NSTextField!
    @IBOutlet weak var Mon24HourHighLabel: NSTextField!
    @IBOutlet weak var MonVolumeLabel: NSTextField!
    

    
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        start()
        startTimer()
    }

    

    func startTimer()
    {
        let timer: Timer!
        timer = Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: #selector(start), userInfo: nil, repeats: false)
    }
    @IBAction func UpdatePrice(_ sender: Any) {
        start()
        
    }
    @IBAction func refreshButton(_ sender: Any) {
        start()
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @objc func start(){
        //print(Variables.DogeStatIndex)
        let doge = DogeMarketClass()
            dogeArray = doge.DogeMarketQuery()
        
        let BTC = BTCMarketClass()
        BTCArray = BTC.BTCMarketQuery()
        
         let ETH = ETHMarketClass()
        ETHArray = ETH.EthMarketQuery()
        
      let test = BaseMarketClass()
        
        test.MarketQuery(cur: "BTC")
        
        let Mon = MonMarketClass()
        MonArray = Mon.MonMarketQuery()
          // print("print value finish")
       // print("view controllerprinting \(price2)")
       
       // BTCtext.stringValue = String(price2)
       // BTCPriceLabel.stringValue = "$\(String(price2))"
         //print("print value finish")
        print("DogeArray:\(dogeArray)")
         print("MonArray:\(MonArray)")
         print("BTCArray:\(BTCArray)")
         print("EthArray:\(ETHArray)")
        DogeReInit()
        BTCReInit()
        EthReInit()
        MonReInit()
        updateGraph()
}
 
   func updateGraph(){
        print("update graph ran")
        for i in 0..<5 {
            let value = ChartDataEntry(x: Double(i) , y: Double(i))
            lineChartEntry.append(value)
            let line1 = LineChartDataSet(values: lineChartEntry, label: "Number")
            line1.colors = [NSUIColor.blue]
            let data = LineChartData()
            data.addDataSet(line1)
            
           //LineChartView1.data = data
       //LineChartView1.chartDescription?.text = "test chart yooo"
            
        }
    }

    func DogeReInit(){
    let dogeLastString = String(dogeArray[0])
    let doge24hrChangeString = String(dogeArray[1])
    let doge24hrHighString = String(dogeArray[2])
    let doge24hrLowString = String(dogeArray[3])
    let dogeVolumeString = String(dogeArray[4])
        let lastTrunc = dogeLastString.index(dogeLastString.endIndex, offsetBy: -1)
        let dogeLastStringTrunc = dogeLastString.prefix(6)
        
        let hrChangeTrunc = doge24hrChangeString.index(doge24hrChangeString.endIndex, offsetBy: -1)
        let doge24hrChangeStringTrunc = doge24hrChangeString.prefix(4)
        
        let hrHighTrunc = doge24hrHighString.index(doge24hrHighString.endIndex, offsetBy: -1)
        let doge24hrHighStringTrunc = doge24hrHighString.prefix(4)
        
        let hrLowTrunc = doge24hrLowString.index(doge24hrLowString.endIndex, offsetBy: -1)
        let doge24hrLowStringTrunc = doge24hrLowString.prefix(8)
        let dogeVolumeStringTrunc = dogeVolumeString.prefix(8)
        
    DogePriceLabel.stringValue = "$\(dogeLastStringTrunc)"
    Doge24HourChangeLabel.stringValue = "24 Hour Change:\(doge24hrChangeStringTrunc)%"
    Doge24HourHighLabel.stringValue = "24 Hour High:\(doge24hrHighStringTrunc)"
    Doge24HourLowLabel.stringValue = "24 Hour Low:\(doge24hrLowStringTrunc)"
        DogeVolumeLabel.stringValue = "Volume:\(dogeVolumeStringTrunc)"
        
    
    }
    
    func BTCReInit(){
        let BTCLastString = String(BTCArray[0])
        let BTC24hrChangeString = String(BTCArray[1])
        let BTC24hrHighString = String(BTCArray[2])
        let BTC24hrLowString = String(BTCArray[3])
        let BTCVolumeString = String(BTCArray[4])
        let lastTrunc = BTCLastString.index(BTCLastString.endIndex, offsetBy: -1)
        let BTCLastStringTrunc = BTCLastString.prefix(8)
        
        let hrChangeTrunc = BTC24hrChangeString.index(BTC24hrChangeString.endIndex, offsetBy: -1)
        let BTC24hrChangeStringTrunc = BTC24hrChangeString.prefix(4)
        
        let hrHighTrunc = BTC24hrHighString.index(BTC24hrHighString.endIndex, offsetBy: -1)
        let BTC24hrHighStringTrunc = BTC24hrHighString.prefix(8)
        
        let hrLowTrunc = BTC24hrLowString.index(BTC24hrLowString.endIndex, offsetBy: -1)
        let BTC24hrLowStringTrunc = BTC24hrLowString.prefix(8)
        let BTCVolumeStringTrunc = BTCVolumeString.prefix(8)

        BTCPriceLabel.stringValue = "$\(BTCLastStringTrunc)"
        BTC24HourChangeLabel.stringValue = "24 Hour Change:\(BTC24hrChangeStringTrunc)%"
        BTC24HourHighLabel.stringValue = "24 Hour High:\(BTC24hrHighStringTrunc)"
        BTC24HourLowLabel.stringValue = "24 Hour Low:\(BTC24hrLowStringTrunc)"
        BTCVolumeLabel.stringValue = "Volume:\(BTCVolumeStringTrunc)"
        
        
    }
    func MonReInit(){
        let MonLastString = String(MonArray[0])
        let Mon24hrChangeString = String(MonArray[1])
        let Mon24hrHighString = String(MonArray[2])
        let Mon24hrLowString = String(MonArray[3])
        let MonVolumeString = String(MonArray[4])
        let lastTrunc = MonLastString.index(MonLastString.endIndex, offsetBy: -0)
        let MonLastStringTrunc = MonLastString.substring(to: lastTrunc)
        
        let hrChangeTrunc = Mon24hrChangeString.index(Mon24hrChangeString.endIndex, offsetBy: -0)
        let Mon24hrChangeStringTrunc = Mon24hrChangeString.prefix(5)
        
        let hrHighTrunc = Mon24hrHighString.index(Mon24hrHighString.endIndex, offsetBy: -1)
        let Mon24hrHighStringTrunc = Mon24hrHighString.prefix(5)
        
        let hrLowTrunc = Mon24hrLowString.index(Mon24hrLowString.endIndex, offsetBy: -1)
        let Mon24hrLowStringTrunc = Mon24hrLowString.prefix(5)
        let MonVolumeStringTrunc = MonVolumeString.prefix(8)
        MonPriceLabel.stringValue = "$\(MonLastStringTrunc)"
        Mon24HourChangeLabel.stringValue = "24 Hour Change:\(Mon24hrChangeStringTrunc)%"
        Mon24HourHighLabel.stringValue = "24 Hour High:\(Mon24hrHighStringTrunc)"
        Mon24HourLowLabel.stringValue = "24 Hour Low:\(Mon24hrLowStringTrunc)"
        MonVolumeLabel.stringValue = "Volume:\(MonVolumeStringTrunc)"
        
        
    }
    func EthReInit(){
        let EthLastString = String(ETHArray[0])
        let Eth24hrChangeString = String(ETHArray[1])
        let Eth24hrHighString = String(ETHArray[2])
        let Eth24hrLowString = String(ETHArray[3])
        let EthVolumeString = String(ETHArray[4])
        let lastTrunc = EthLastString.index(EthLastString.endIndex, offsetBy: -1)
        let EthLastStringTrunc = EthLastString.prefix(5)
        
        let hrChangeTrunc = Eth24hrChangeString.index(Eth24hrChangeString.endIndex, offsetBy: -1)
        let Eth24hrChangeStringTrunc = Eth24hrChangeString.prefix(4)
        
        let hrHighTrunc = Eth24hrHighString.index(Eth24hrHighString.endIndex, offsetBy: -1)
        let Eth24hrHighStringTrunc = Eth24hrHighString.prefix(5)
        
        let hrLowTrunc = Eth24hrLowString.index(Eth24hrLowString.endIndex, offsetBy: -1)
        let Eth24hrLowStringTrunc = Eth24hrLowString.prefix(5)
        
        let EthVolumeStringTrunc = EthVolumeString.prefix(10)
        EthPriceLabel.stringValue = "$\(EthLastStringTrunc)"
        Eth24HourChangeLabel.stringValue = "24 Hour Change:\(Eth24hrChangeStringTrunc)%"
        Eth24HourHigh.stringValue = "24 Hour High:\(Eth24hrHighStringTrunc)"
        Eth24HourLowLabel.stringValue = "24 Hour Low:\(Eth24hrLowStringTrunc)"
        EthVolumeLabel.stringValue = "Volume:\(EthVolumeStringTrunc)"
        
        
    }
}
