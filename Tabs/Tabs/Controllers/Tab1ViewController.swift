
import UIKit

class Tab1ViewController: UIViewController {

    weak var delegate: TabScrollViewControllerDelegate?

}

extension Tab1ViewController: TabChildComponent {

    var viewController: UIViewController {
        return self
    }

}

extension Tab1ViewController: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        delegate?.scrollDidScroll(offset: scrollView.contentOffset.y)
    }

}
