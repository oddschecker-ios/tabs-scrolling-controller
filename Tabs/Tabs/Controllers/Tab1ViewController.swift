
import UIKit

class Tab1ViewController: UIViewController {


    weak var delegate: TabScrollViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    private func setupViews() {}

    private func setupHierarchy() {}

    private func setupConstraints() {}

}

extension Tab1ViewController: TabChildComponent {

    var viewController: UIViewController {
        return self
    }

}

extension Tab1ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath)
    }
    
}

extension Tab1ViewController: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        delegate?.scrollDidScroll(offset: scrollView.contentOffset.y)
    }

}
