//
//  TableViewController.swift
//  COVID-19
//
//  Created by turion789 on 3.11.20.
//

import UIKit
class TableViewController: UITableViewController {
    
    var timer: Timer!
    var casesss = [COVID]()
    let url = URL(string: "https://covid19.mathdro.id/api/confirmed")
    
    @IBAction func refreshControl(_ sender: UIRefreshControl) {
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(endOfWork), userInfo: nil, repeats: true)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
    }
    
    @objc func endOfWork() {
        downloadJSON()
        tableView.reloadData()
        timer.invalidate()
        timer = nil
        DispatchQueue.main.async {
        self.tableView.refreshControl?.endRefreshing()
        }
    }
    
    
    
    func downloadJSON(){
        guard let downloadURL = url else {return}
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else{
                return
            }
            do{
                let decoder = JSONDecoder()
                let downloaderCase = try decoder.decode([COVID].self, from: data)
                print("количество строк - \(downloaderCase.count)")
                self.casesss = downloaderCase
                
                
                
                if self.casesss.count != 0 {
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }

                }
               
            }catch{
                
                print("download_Static")
            }
    }.resume()
        
}
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return casesss.count
    }
   

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else {return UITableViewCell()}
        
        if casesss[indexPath.row].provinceState == nil{
            cell.countryLable.text = casesss[indexPath.row].countryRegion
        }else{
            let cas: String = casesss[indexPath.row].provinceState ?? casesss[indexPath.row].countryRegion
            cell.countryLable.text = cas + " / " + casesss[indexPath.row].countryRegion
        }
        
        //cell.confirmLable.text = String("Infected: \(casesss[indexPath.row].confirmed)")
        cell.confirmLable.text = NSLocalizedString("Infected: ", comment: " Infected in table") + String("\(casesss[indexPath.row].confirmed)")
        if casesss[indexPath.row].recovered == 0{
            cell.deathLable.text = "N/A"
        }else{
            cell.deathLable.text = NSLocalizedString("Recovered: ", comment: "var Recovered in table") + String("\(casesss[indexPath.row].recovered)")
        }

        cell.layer.cornerRadius = 50
        cell.backgroundColor = .systemGray6
        cell.layer.borderWidth = 10
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.separatorInset.bottom = 10
        cell.layoutMargins.top = 10

        cell.flagCountryImageView.image = UIImage(named: casesss[indexPath.row].countryRegion)
        cell.deathLable.textColor = .red
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?){

        if segue.identifier == "goDetail"{
            
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
            let detailVC: ViewControllerInTable = segue.destination as! ViewControllerInTable
            detailVC.allInfectedPeople += String(casesss[indexPath!.row].confirmed)
            if casesss[indexPath!.row].recovered == 0{
                detailVC.recoveredInCell += "N/A"
            }else{detailVC.recoveredInCell += String(casesss[indexPath!.row].recovered)}
            detailVC.countryTitleInCell.title = casesss[indexPath!.row].countryRegion

         }
    }
    
    
}
