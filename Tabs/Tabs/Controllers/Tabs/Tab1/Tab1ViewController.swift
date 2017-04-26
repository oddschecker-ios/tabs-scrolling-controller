
import UIKit

class Tab1ViewController: UIViewController {

    fileprivate let colorGreen = UIColor.red
    fileprivate let colorBlack = UIColor.green
    fileprivate let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    weak var tabsDelegate: TabsComponentDelegate?
    weak var tabsDataSource: TabsComponentDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
        collectionView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        collectionView.delegate = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        collectionView.delegate = nil
    }

    private func setupViews() {

        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(Tab1CollectionViewCell.self, forCellWithReuseIdentifier: "id")
    }

    private func setupHierarchy() {

        view.addSubview(collectionView)
    }

    private func setupConstraints() {

        collectionView.pinToSuperviewEdges()
    }
}

extension Tab1ViewController: TabsChildComponent {

    var viewController: UIViewController {

        return self
    }

    func reset() {

        tabsDelegate = nil
        collectionView.delegate = nil
        collectionView.setContentOffset(.zero, animated: false)
    }
}

extension Tab1ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! Tab1CollectionViewCell

        cell.titleLabel.text = indexPath.row.description

        let percentage = CGFloat(indexPath.row) / CGFloat(10 - 1)
        cell.backgroundColor = fadeFromColor(colorBlack, toColor:colorGreen, withPercentage:percentage)

        return cell
    }
}

extension Tab1ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        let height = tabsDataSource?.heightForTopComponent() ?? 0

        let size = CGSize(width: collectionView.frame.width, height: height)
        return size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsetsMake(0, 0, 0, 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }
}

extension Tab1ViewController: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        tabsDelegate?.scrollDidScroll(offset: scrollView.contentOffset.y)
    }
}
