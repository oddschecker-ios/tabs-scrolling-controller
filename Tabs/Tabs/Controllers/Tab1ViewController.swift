
import UIKit

class Tab1ViewController: UIViewController {

    weak var delegate: TabScrollViewControllerDelegate?
    fileprivate let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
        collectionView.reloadData()
    }

    private func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(TabUICollectionViewCell.self, forCellWithReuseIdentifier: "id")
    }

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.pinToSuperviewEdges()
    }
}

extension Tab1ViewController: TabChildComponent {

    var viewController: UIViewController {
        return self
    }

    func updateInset(inset: UIEdgeInsets) {
        collectionView.contentInset = inset
    }
}

extension Tab1ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! TabUICollectionViewCell

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: 60)
    }
}

extension Tab1ViewController: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        delegate?.scrollDidScroll(offset: scrollView.contentOffset.y)
    }
}
