//
//  TableViewController.swift
//  COVID-19
//
//  Created by turion789 on 3.11.20.
//

import UIKit

class TableViewController: UITableViewController {

    
   // var statisticsCovid:StatisticsCovid = StatisticsCovid()
    var casesss = [Case]()
    let url = URL(string: "https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST?disableRedirect=true")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON()
       
        
    }
    
    func downloadJSON(){
        guard let downloadURL = url else {return}
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else{
                print("something")
                return
            }
            do{
                let decoder = JSONDecoder()
                let downloaderCase = try decoder.decode([Case].self, from: data)
                print("qqqqqqq - \(downloaderCase.count)")
                self.casesss = downloaderCase
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
                
            }catch{
                print("download")
            }
    }.resume()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
}
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return casesss.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else {return UITableViewCell()}

        cell.countryLable.text = casesss[indexPath.row].country
        cell.confirmLable.text = String(casesss[indexPath.row].infected!)
        cell.deathLable.text = String(casesss[indexPath.row].recovered ?? 0)
//        print(String(casesss[indexPath.row].infected!))

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?){

        if segue.identifier == "goDetail"{
            
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
            let detailVC: ViewControllerInTable = segue.destination as! ViewControllerInTable
            let statisticsCovidVar = casesss[indexPath?.row ?? 0]
            detailVC.setupCellTable(country: statisticsCovidVar)
         }
    }
}
