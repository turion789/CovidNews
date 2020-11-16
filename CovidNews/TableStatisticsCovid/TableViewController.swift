//
//  TableViewController.swift
//  COVID-19
//
//  Created by turion789 on 3.11.20.
//

import UIKit
class TableViewController: UITableViewController {
    
    var timer: Timer!
    var casesss = [Case]()
    let url = URL(string: "https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST?disableRedirect=true")
    
    @IBAction func refreshControl(_ sender: UIRefreshControl) {
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(endOfWork), userInfo: nil, repeats: true)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
    }
    
    @objc func endOfWork() {
        downloadJSON()
        tableView.reloadData()
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
           }
        timer.invalidate()
        timer = nil
    }
    
    
    func downloadJSON(){
        guard let downloadURL = url else {return}
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else{
                return
            }
            do{
                let decoder = JSONDecoder()
                let downloaderCase = try decoder.decode([Case].self, from: data)
                print("количество строк - \(downloaderCase.count)")
                self.casesss = downloaderCase
                DispatchQueue.main.async {self.tableView.reloadData()}
            }catch{
                print("download")
            }
    }.resume()
        
}
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return casesss.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else {return UITableViewCell()}

        cell.countryLable.text = casesss[indexPath.row].country
        cell.confirmLable.text = String(casesss[indexPath.row].infected!)
        cell.deathLable.text = String(casesss[indexPath.row].recovered!)
//      print(String(casesss[indexPath.row].infected!))
        return cell
    }
     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 10.0
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?){

        if segue.identifier == "goDetail"{
            
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
            let detailVC: ViewControllerInTable = segue.destination as! ViewControllerInTable
            detailVC.confirmedCell += String(casesss[indexPath!.row].infected!)
            detailVC.countryTitleInCell.title = casesss[indexPath!.row].country
            detailVC.deathCell += String(casesss[indexPath!.row].recovered!)
            //detailVC.confirmedCell
//            let statisticsCovidVar = casesss[indexPath?.row ?? 0]
//            detailVC.setupCellTable(country: statisticsCovidVar)
         }
    }
    
    
}
