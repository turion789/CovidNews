
import UIKit

class NewsViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var news:News = News()
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        navigationItem.title = "News"
        self.collectionView.register(UINib(nibName: "NewsCollectionCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
}
    
    
extension NewsViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.newsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionCell", for: indexPath) as! NewsCollectionCell
        let newsNw = news.newsArray[indexPath.item]
        cell.setupCell(article: newsNw)
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(30)
    }
     
}
