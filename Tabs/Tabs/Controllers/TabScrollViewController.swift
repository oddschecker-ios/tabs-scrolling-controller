import UIKit

protocol TabScrollViewNavigator {
    func getTopComponent() -> TabTopComponent
    func getChildComponent(_ index: Int) -> TabChildComponent
}

class TabScrollViewController: UIViewController {

    private let buttonTab1 = UIButton()
    private let buttonTab2 = UIButton()
    fileprivate let navBarHeight: CGFloat = 64.0

    fileprivate let topContainerView = UIView()
    fileprivate let tabContainerView = UIView()
    fileprivate let contentContainerView = UIView()

    fileprivate let maxTopViewY = CGFloat(0)
    fileprivate var topComponent: TabTopComponent!
    fileprivate var tabComponents: [TabChildComponent]!
    fileprivate var selectedTabComponent: TabChildComponent!

    var topTopContainerViewConstraint: NSLayoutConstraint?
    var heightTopContainerViewConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    private func setupViews() {

        automaticallyAdjustsScrollViewInsets = false

        topComponent = getTopComponent()

        let controller1 = Tab1ViewController()
        controller1.view.backgroundColor = .blue

        let controller2 = Tab2ViewController()
        controller2.view.backgroundColor = .darkGray

        tabComponents = [controller1, controller2]

        topContainerView.backgroundColor = .red
        contentContainerView.backgroundColor = .yellow

        buttonTab1.backgroundColor = .blue
        buttonTab1.setTitle(NSLocalizedString("Tab1", comment: ""), for: .normal)
        buttonTab1.addTarget(self, action: #selector(tab1Tapped), for: .touchUpInside)

        buttonTab2.backgroundColor = .green
        buttonTab2.setTitle(NSLocalizedString("Tab2", comment: ""), for: .normal)
        buttonTab2.addTarget(self, action: #selector(tab2Tapped), for: .touchUpInside)
    }

    private func setupHierarchy() {

        view.addSubview(contentContainerView)
        view.addSubview(topContainerView)
        view.addSubview(tabContainerView)

        tabContainerView.addSubview(buttonTab1)
        tabContainerView.addSubview(buttonTab2)
    }

    private func setupConstraints() {

        add(topComponent.viewController, to: topContainerView)

        let childComponent = getChildComponent(0)
        selectedTabComponent = childComponent
        selectedTabComponent.delegate = self
        add(selectedTabComponent.viewController, to: contentContainerView)

        topContainerView.pinToSuperview([.left, .right])
        topTopContainerViewConstraint = topContainerView.pinToSuperviewTop()
        heightTopContainerViewConstraint = topContainerView.addHeightConstraint(withConstant: topComponent.height)

        contentContainerView.pinToSuperviewEdges()

        tabContainerView.alpha = 0.7
        tabContainerView.backgroundColor = .white
        tabContainerView.pinToSuperview([.left, .right])
        tabContainerView.alignBottomToView(topContainerView)
        tabContainerView.addHeightConstraint(withConstant: 50)

        buttonTab1.equalWidthTo(buttonTab2)
        buttonTab1.horizontalSpaceToView(buttonTab2)
        buttonTab1.pinToSuperview([.left, .top, .bottom])
        buttonTab2.pinToSuperview([.right, .top, .bottom])
    }

    //MARK: - Actions

    func tab1Tapped() {

        selectTabComponent(tabComponents[0])
    }

    func tab2Tapped() {

        selectTabComponent(tabComponents[1])
    }

    private func selectTabComponent(_ tabComponent: TabChildComponent) {

        selectedTabComponent.reset()
        remove(selectedTabComponent.viewController)

        topTopContainerViewConstraint?.constant = 0
        heightTopContainerViewConstraint?.constant = topComponent.height

        selectedTabComponent = tabComponent
        selectedTabComponent.delegate = self
        add(selectedTabComponent.viewController, to: contentContainerView)
    }
}

extension TabScrollViewController: TabScrollViewControllerDelegate {

    func scrollDidScroll(offset: CGFloat) {

        if offset <= 0 {

            topTopContainerViewConstraint?.constant = 0
            heightTopContainerViewConstraint?.constant = topComponent.height + -offset
        } else {

            let constant = min(offset, topComponent.height - navBarHeight - tabContainerView.frame.height)

            topTopContainerViewConstraint?.constant = -constant
            heightTopContainerViewConstraint?.constant = topComponent.height
        }
    }

    func heightForTopComponent() -> CGFloat {

        return topComponent.height
    }
}

extension TabScrollViewController: TabScrollViewNavigator {

    func getTopComponent() -> TabTopComponent {

        return TopViewController()
    }

    func getChildComponent(_ index: Int) -> TabChildComponent {

        let childComponent: TabChildComponent = tabComponents[index]
        return childComponent
    }
}
