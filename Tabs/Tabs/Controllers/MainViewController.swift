import UIKit

class MainViewController: UIViewController {

    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    private func setupViews() {

        button.setTitle(NSLocalizedString("Go", comment: ""), for: .normal)
        button.addTarget(self, action: #selector(tabsTapped), for: .touchUpInside)
    }

    private func setupHierarchy() {

        view.addSubview(button)
    }

    private func setupConstraints() {

        button.pinToSuperviewTop(withInset: 64)
        button.alignHorizontalCenter(withView: view)
    }

    func tabsTapped() {

        let topViewController = TopViewController()
        let selectorViewController = SelectorViewController()

        let tab1ViewController = Tab1ViewController()
        let tab2ViewController = Tab2ViewController()

        let tabsComponentViewController = TabsComponentViewController(tabsTopComponent: topViewController, tabsSelectorComponent: selectorViewController, tabsChildComponents: [tab1ViewController, tab2ViewController])

        navigationController?.pushViewController(tabsComponentViewController, animated: true)
    }
}

