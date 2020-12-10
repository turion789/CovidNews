
import UIKit
import SwiftyJSON
import Alamofire


class NewsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    var articleArray = [[String: AnyObject]]()
    let myRefrashControl:UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:#selector(handleRefreshControl(sender:)),for: .valueChanged)
        return refreshControl
        
    }()
        
    @objc private func handleRefreshControl(sender: UIRefreshControl ) {
        articleArray.removeAll()
        collectionView.reloadData()
        self.DATA()
        DispatchQueue.main.async {
            self.collectionView.refreshControl?.endRefreshing()
            
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.refreshControl = myRefrashControl
        navigationItem.title = tabBarItem.title
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.DATA()
        
    }
    
    func DATA() {
        let  Url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=a6dbb9693ad24a18a56e0e881cd47c09")
        Alamofire.request(Url!).validate().responseJSON { (response) in
            if ((response.result.value) != nil){
                let jsondata = JSON(response.result.value!)
                print(jsondata)
                if let arrayObjectJson = jsondata["articles"].arrayObject{
                    self.articleArray = arrayObjectJson as! [[String : AnyObject]]
                    
                }
                
            }
            if self.articleArray.count > 0 {
                DispatchQueue.main.async{
                    self.collectionView?.reloadData()
                }
                
            }
            
        }
        
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleArray.count
    }
    
   // "publishedAt":"2020-12-10T13:07:18.6192945Z"
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionCell", for: indexPath) as! NewsCollectionCell
        let iP = articleArray[indexPath.row]
        cell.authorNews.text = iP["author"] as? String
        cell.titleNews.text = iP["title"] as? String
        
        
        
        let dateFormatter = DateFormatter()
        let string = iP["publishedAt"] as! String
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        guard let inputDate  = dateFormatter.date(from: string) else { return cell}
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateStyle = .long
        
        let stringDate = dateFormatter2.string(from: inputDate)
        if stringDate == stringDate {cell.datePublishedNews.text = stringDate}
        
        
        
        
        
        
        
        
        
        let queue = DispatchQueue.global(qos: .userInteractive)
        queue.async{
            if let url = URL(string: iP["urlToImage"] as! String){
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        cell.imageBackground.image = UIImage(data: data)
                        
                    }
                    
                }
                
            }
            
        }
        cell.layer.cornerRadius = 20
        cell.backgroundColor = .white
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layoutMargins.top = 10
        return cell
        
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(30)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?){
        if segue.identifier == "showWeb"{
            let indexPath = self.collectionView.indexPath(for: sender as! UICollectionViewCell)
            let detailVC: DetailNewsViewController = segue.destination as! DetailNewsViewController
            let url = articleArray[indexPath!.row]
            detailVC.myURL = (url["url"] as? String)!

         }
        
    }
    
}


