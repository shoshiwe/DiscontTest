//
//  InformationsViewController.swift
//  DidcontTest
//
//  Created by shoshi weinberg on 1/15/20.
//  Copyright © 2020 Weizmann. All rights reserved.
//

import UIKit
import JGProgressHUD
import SwiftChart


class InformationsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmented:UISegmentedControl!
    @IBOutlet weak var chartView:Chart!
    
    var symbol:String = ""
    var interval:String = "1min"
    var listInformations:[String:Sery]=[:]
    var keys:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        segmented.selectedSegmentIndex = 0
        loadData()
    }
    

    @IBAction func valueInSegmentChanged(_ sender: Any) {
        interval = segmented.titleForSegment(at: segmented.selectedSegmentIndex) ?? interval
        
        interval = interval.replacingOccurrences(of: " ", with: "")
        loadData()
        
    }
    func loadData() {
      let hud = JGProgressHUD(style: .dark)
       hud.textLabel.text = "Loading"
       hud.show(in: self.view)

        AlphavantageManager .getAlphavantageData(function: "TIME_SERIES_INTRADAY", symbol: symbol, interval: interval,completion:   { [weak self] response in
            hud.dismiss()
            
            guard response.isSuccess else {
                   //show alert with error
                           return
                       }
            guard response.value != nil else {
                return
            }
            let alphavantage:Alphavantage = response.value as! Alphavantage
            if  let series = alphavantage.timeSeries?.series {
                self?.listInformations = series
                self?.keys = Array((self?.listInformations.keys)!)
                self?.keys = AlphavantageManager.sortTimeKeys(list: self?.keys ?? [])
            }
            //self?.drawGraph()
            self?.tableView.reloadData()
            
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func drawGraph(){
        var minimum = MAXFLOAT
        var max:Float = 0.0
        var data:[(x: Double, y: Double)] = []
        for key in self.keys{
            let sery = listInformations[key]
            let volume = Float(sery!.volume)!
            if volume < minimum {
                minimum = volume
            }
            if volume > max{
                max = volume
            }
            
            data.append((x: key.dateFromString(format: "").timeIntervalSince1970, y: Double(sery!.volume)!))
        }
        let d:DateFormatter = DateFormatter()
        d.dateFormat = "HH"
        chartView.minY = Double(minimum)
        chartView.maxY = Double(max)
        chartView.xLabelsFormatter = { d.string(from: Date(timeIntervalSince1970: $1)) }
        let series = ChartSeries(data: data)
        chartView.add(series)
    }
 
}
// MARK: - UITableViewDelegate,UITableViewDataSource
extension InformationsViewController:UITableViewDelegate,
UITableViewDataSource{
    
    static let cellIdentifier = "InformationItemTableViewCell"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listInformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:InformationItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: InformationsViewController.cellIdentifier, for: indexPath) as! InformationItemTableViewCell
        if let sery:Sery = listInformations[keys[indexPath.row]]{
            cell.lblHigh.text = sery.high
            cell.lblLow.text =  sery.low
            cell.lblOpen.text = sery.open
            cell.lblClose.text = sery.close
            cell.lblVolume.text = sery.volume
        }
        cell.lblTime.text = keys[indexPath.row].dateConverter(incomingFormat: "yyyy-MM-dd HH:mm:ss", outGoingFormat: "HH:mm:ss")
       return cell
    }
    
    
}
