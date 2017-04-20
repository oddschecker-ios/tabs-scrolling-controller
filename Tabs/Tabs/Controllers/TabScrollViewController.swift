import UIKit

protocol TabScrollViewNavigator {
    func getTopComponent() -> TabTopComponent
    func getChildComponent(_ index: Int) -> TabChildComponent
}

class TabScrollViewController: UIViewController {

    private let topContainerView = UIView()
    private let contentContainerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    private func setupViews() {
        topContainerView.backgroundColor = .red
        contentContainerView.backgroundColor = .yellow
    }

    private func setupHierarchy() {
        view.addSubview(topContainerView)
        view.addSubview(contentContainerView)
    }

    private func setupConstraints() {

        let topComponent = getTopComponent()
        add(topComponent.viewController, to: topContainerView)

        let childComponent = getChildComponent(0)
         add(childComponent.viewController, to: contentContainerView)

        topContainerView.pinToSuperview([.top, .left, .right])
        topContainerView.addHeightConstraint(withConstant: topComponent.height)

        contentContainerView.attachToBottomOf(topContainerView)
        contentContainerView.pinToSuperview([.left, .right, .bottom])
    }

}

extension TabScrollViewController: TabScrollViewControllerDelegate {

    func scrollDidScroll(offset: CGFloat) {

    }

}

extension TabScrollViewController: TabScrollViewNavigator {

    func getTopComponent() -> TabTopComponent {
        return TopViewController()
    }

    func getChildComponent(_ index: Int) -> TabChildComponent {

        let childComponent: TabChildComponent

        if index == 0 {

            let controller = Tab1ViewController()
            controller.delegate = self

            childComponent = controller

        } else if index == 1 {

            let controller = Tab2ViewController()
            controller.delegate = self

            childComponent = controller
        } else {

            preconditionFailure("No component for index")
        }

        return childComponent
    }
}
