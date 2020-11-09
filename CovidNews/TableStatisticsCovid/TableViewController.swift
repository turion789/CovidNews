//
//  TableViewController.swift
//  COVID-19
//
//  Created by turion789 on 3.11.20.
//

import UIKit

class TableViewController: UITableViewController {

    
    var statisticsCovid:StatisticsCovid = StatisticsCovid()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return statisticsCovid.statisticArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let statisticsCovidVar = statisticsCovid.statisticArray[indexPath.row]
        cell.setupCellTable(country: statisticsCovidVar)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?){

        if segue.identifier == "goDetail"{
            
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
            let detailVC: ViewControllerInTable = segue.destination as! ViewControllerInTable
            let statisticsCovidVar = statisticsCovid.statisticArray[indexPath!.row]
            detailVC.setupCellTable(country: statisticsCovidVar)
         
         }
    }
}
