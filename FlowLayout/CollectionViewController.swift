
import UIKit

class CollectionViewController: UIViewController {
  
  @IBOutlet var collectionView: UICollectionView!
  let cellIdentifier = "CustomCell"
  let stackIdentifier = "StackViewCell"
  let regularIdentifier = "RegularCell"

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let customCellNib = UINib(nibName: cellIdentifier, bundle: nil)
    collectionView.registerNib(customCellNib, forCellWithReuseIdentifier: cellIdentifier)
    
    let itemSize = traitCollection.horizontalSizeClass == .Regular ? CGSize(width: 240, height: 194)
                                                                   : CGSize(width: 340, height: 128)
    (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = itemSize
  }

}

extension CollectionViewController: UICollectionViewDataSource {
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let identifier = indexPath.row % 2 == 0 ? regularIdentifier : stackIdentifier
    return collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath)
  }
  
}
