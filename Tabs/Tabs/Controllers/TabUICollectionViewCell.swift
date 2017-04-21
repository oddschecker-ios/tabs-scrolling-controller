
import UIKit

class TabUICollectionViewCell: UICollectionViewCell {

    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        contentView.addSubview(titleLabel)
    }

    private func setupConstraints() {
        titleLabel.pinToSuperviewEdges()
    }
}
