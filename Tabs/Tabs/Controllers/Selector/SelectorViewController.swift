import UIKit

class SelectorViewController: UIViewController {

    private let buttonTab1 = UIButton()
    private let buttonTab2 = UIButton()
    private let bottomBorder1 = UIView()
    private let bottomBorder2 = UIView()

    weak var delegate: TabsSelectorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    private func setupViews() {

        buttonTab1.setTitle(NSLocalizedString("Tab1", comment: ""), for: .normal)
        buttonTab1.addTarget(self, action: #selector(tab1Tapped), for: .touchUpInside)

        buttonTab2.setTitle(NSLocalizedString("Tab2", comment: ""), for: .normal)
        buttonTab2.addTarget(self, action: #selector(tab2Tapped), for: .touchUpInside)

        bottomBorder1.backgroundColor = .yellow
        bottomBorder2.backgroundColor = .yellow

        bottomBorder1.isHidden = false
        bottomBorder2.isHidden = true

        buttonTab1.setTitleColor(UIColor(white: 1, alpha: 0.7), for: .normal)
        buttonTab1.setTitleColor(.white, for: .selected)

        buttonTab2.setTitleColor(UIColor(white: 1, alpha: 0.7), for: .normal)
        buttonTab2.setTitleColor(.white, for: .selected)

        buttonTab1.isSelected = true
        buttonTab2.isSelected = false
    }

    private func setupHierarchy() {

        view.addSubview(buttonTab1)
        view.addSubview(buttonTab2)
        view.addSubview(bottomBorder1)
        view.addSubview(bottomBorder2)
    }

    private func setupConstraints() {

        buttonTab1.equalWidthTo(buttonTab2)
        buttonTab1.horizontalSpaceToView(buttonTab2)
        buttonTab1.pinToSuperview([.left, .top, .bottom])
        buttonTab2.pinToSuperview([.right, .top, .bottom])

        bottomBorder1.equalWidthTo(buttonTab1)
        bottomBorder2.equalWidthTo(buttonTab2)
        bottomBorder1.alignHorizontalCenter(withView: buttonTab1)
        bottomBorder2.alignHorizontalCenter(withView: buttonTab2)
        bottomBorder1.addHeightConstraint(withConstant: 3)
        bottomBorder2.addHeightConstraint(withConstant: 3)
        bottomBorder1.pinToSuperviewBottom()
        bottomBorder2.pinToSuperviewBottom()
    }

    func tab1Tapped() {

        delegate?.tabsSelectorDelegateDidSelect(index: 0)
        bottomBorder1.isHidden = false
        bottomBorder2.isHidden = true

        buttonTab1.isSelected = true
        buttonTab2.isSelected = false
    }

    func tab2Tapped() {

        delegate?.tabsSelectorDelegateDidSelect(index: 1)
        bottomBorder1.isHidden = true
        bottomBorder2.isHidden = false

        buttonTab1.isSelected = false
        buttonTab2.isSelected = true
    }
}

extension SelectorViewController: TabsSelectorComponent {

    var height: CGFloat {

        return 48.0
    }

    var viewController: UIViewController {
        return self
    }
}
