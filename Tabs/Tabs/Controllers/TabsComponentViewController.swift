import UIKit

class TabsComponentViewController: UIViewController {

    fileprivate let navBarHeight: CGFloat = 64.0

    fileprivate let topContainerView = UIView()
    fileprivate let tabContainerView = UIView()
    fileprivate let contentContainerView = UIView()

    fileprivate let topComponent: TabsTopComponent
    fileprivate let tabsComponents: [TabsChildComponent]
    fileprivate var selectorComponent: TabsSelectorComponent
    fileprivate var selectedTabComponent: TabsChildComponent!

    fileprivate var topTopContainerViewConstraint: NSLayoutConstraint!
    fileprivate var heightTopContainerViewConstraint: NSLayoutConstraint!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(tabsTopComponent: TabsTopComponent, tabsSelectorComponent: TabsSelectorComponent, tabsChildComponents: [TabsChildComponent]) {

        guard tabsChildComponents.count != 0 else {
            preconditionFailure("No tabs added")
        }

        topComponent = tabsTopComponent
        tabsComponents = tabsChildComponents
        selectorComponent = tabsSelectorComponent

        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    private func setupViews() {

        selectorComponent.delegate = self

        let childComponent = tabsComponents[0]
        selectedTabComponent = childComponent
        selectedTabComponent.tabsDelegate = self
        selectedTabComponent.tabsDataSource = self

        automaticallyAdjustsScrollViewInsets = false
    }

    private func setupHierarchy() {

        view.addSubview(contentContainerView)
        view.addSubview(topContainerView)
        view.addSubview(tabContainerView)
    }

    private func setupConstraints() {

        add(topComponent.viewController, to: topContainerView)

        add(selectedTabComponent.viewController, to: contentContainerView)

        topContainerView.pinToSuperview([.left, .right])
        topTopContainerViewConstraint = topContainerView.pinToSuperviewTop()
        heightTopContainerViewConstraint = topContainerView.addHeightConstraint(withConstant: topComponent.height)

        contentContainerView.pinToSuperviewEdges()

        tabContainerView.pinToSuperview([.left, .right])
        tabContainerView.alignBottomToView(topContainerView)
        tabContainerView.addHeightConstraint(withConstant: selectorComponent.height)

        add(selectorComponent.viewController, to: tabContainerView)
    }
}

extension TabsComponentViewController: TabsSelectorDelegate {

    func tabsSelectorDelegateDidSelect(index: Int) {

        if index < tabsComponents.count,
            selectedTabComponent.viewController != tabsComponents[index].viewController {
            selectTabComponent(tabsComponents[index])
        }
    }

    private func selectTabComponent(_ tabComponent: TabsChildComponent) {

        selectedTabComponent.reset()
        remove(selectedTabComponent.viewController)

        topTopContainerViewConstraint.constant = 0
        heightTopContainerViewConstraint.constant = topComponent.height

        selectedTabComponent = tabComponent
        selectedTabComponent.tabsDelegate = self
        selectedTabComponent.tabsDataSource = self
        add(selectedTabComponent.viewController, to: contentContainerView)
    }
}

extension TabsComponentViewController: TabsComponentDelegate {

    func scrollDidScroll(offset: CGFloat) {

        if offset <= 0 {

            topTopContainerViewConstraint.constant = 0
            heightTopContainerViewConstraint?.constant = topComponent.height + -offset
        } else {

            let constant = min(offset, topComponent.height - navBarHeight - selectorComponent.height)

            topTopContainerViewConstraint.constant = -constant
            heightTopContainerViewConstraint.constant = topComponent.height
        }
    }
}

extension TabsComponentViewController: TabsComponentDataSource {

    func heightForTopComponent() -> CGFloat {

        return topComponent.height
    }

    func collapsedTopOffset() -> CGFloat {

        return navBarHeight + selectorComponent.height
    }

}

