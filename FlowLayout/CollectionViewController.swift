
import UIKit

class CollectionViewController: UIViewController {
  
  @IBOutlet var collectionView: UICollectionView!
  let cellIdentifier = "CustomCell"

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let customCellNib = UINib(nibName: cellIdentifier, bundle: nil)
    self.collectionView.registerNib(customCellNib, forCellWithReuseIdentifier: cellIdentifier)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    collectionView.collectionViewLayout.invalidateLayout()
  }
  
}

extension CollectionViewController: UICollectionViewDataSource {
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
    return cell
  }
  
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular) {
      return CGSizeMake(240, 194)
    }
    else {
      return CGSizeMake(340, 128)
    }
  }
}