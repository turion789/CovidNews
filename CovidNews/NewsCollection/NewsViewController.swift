
import UIKit
import SwiftyJSON
import Alamofire


let url = URL(string: "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a6dbb9693ad24a18a56e0e881cd47c09")
var hzhz = ""

class NewsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //var news:News = News()
    var articleArray = [Welcome]()
//    let apiKey = "a6dbb9693ad24a18a56e0e881cd47c09"
//    let URLStringNews = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=a6dbb9693ad24a18a56e0e881cd47c09")
    var data1 = [[String: AnyObject]]()
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        //collectionView.reloadData()
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
                if let da = jsondata["articles"].arrayObject
                {
                    self.data1 = da as! [[String : AnyObject]]
                }
                if self.data1.count > 0 {
                    self.collectionView?.reloadData()
                }
            }
        }
    }
//    func downloadJSONNews(){
//        guard let downloadURL = URLStringNews else {return}
//        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
//            guard let data = data, error == nil, urlResponse != nil else{
//                return
//            }
//            do{
//                let decoder = JSONDecoder()
//                let downloaderCase = try decoder.decode([Article].self, from: data)
//                print("количество строк - \(downloaderCase.count)")
//                self.articleArray = downloaderCase
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()}
//            }catch{
//                print("download_News")
//            }
//    }.resume()
//}

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data1.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionCell", for: indexPath) as! NewsCollectionCell
        let iP = data1[indexPath.row]
        //let newsNw = articleArray[indexPath.item]
        cell.authorNews.text = iP["author"] as? String
        cell.titleNews.text = iP["title"] as? String
        //cell.urlNews.text = iP["url"] as? String
        cell.wqw1 = "\(iP["url"]!)"
        cell.layer.cornerRadius = 20
        cell.backgroundColor = .white
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layoutMargins.top = 10
        
        //cell.setupCell(article: newsNw)
        return cell
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard segue.identifier == "showSecond" else { return }
//            guard let destination = segue.destination as? DetailNewsViewController else { return }
//        
//        }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(30)
    }
    
     
}
