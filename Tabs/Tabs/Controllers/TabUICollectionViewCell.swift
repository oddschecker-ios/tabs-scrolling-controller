
import UIKit

class TabUICollectionViewCell: UICollectionViewCell {

    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        titleLabel.text = NSLocalizedString("UICollectionViewCell", comment: "")
    }

    private func setupHierarchy() {
        contentView.addSubview(titleLabel)
    }

    private func setupConstraints() {
        titleLabel.pinToSuperviewEdges()
    }
}
