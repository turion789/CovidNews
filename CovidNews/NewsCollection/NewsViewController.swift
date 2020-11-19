
import UIKit
import SwiftyJSON
import Alamofire


class NewsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    var articleArray = [[String: AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News"
        //self.collectionView.register(UINib(nibName: "NewsCollectionCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        //downloadJSONNews()
        self.DATA()
        
    }
    func DATA() {
        let  Url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=a6dbb9693ad24a18a56e0e881cd47c09")
        Alamofire.request(Url!).validate().responseJSON { (response) in
            if ((response.result.value) != nil) {
                let jsondata = JSON(response.result.value!)
                print(jsondata)
                
                if let da = jsondata["articles"].arrayObject{
                    self.articleArray = da as! [[String : AnyObject]]
                    
                }
                
            }
            if self.articleArray.count > 0 {
                self.collectionView?.reloadData()
                
            }
            
        }
        
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionCell", for: indexPath) as! NewsCollectionCell
        let iP = articleArray[indexPath.row]
        
     
            if let url = URL(string: iP["urlToImage"] as! String){
            
            if let data = try? Data(contentsOf: url){
                cell.imageBackground.image = UIImage(data: data)
                
            }
                cell.authorNews.text = iP["author"] as? String
                cell.titleNews.text = iP["title"] as? String
                
            }
        
        cell.urlNews.text = iP["url"] as? String
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
    
     
}
