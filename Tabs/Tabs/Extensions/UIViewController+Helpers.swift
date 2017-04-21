
import UIKit

extension UIViewController {

    func add(_ viewController: UIViewController, to contentView: UIView) {

        viewController.willMove(toParentViewController: self)

        addChildViewController(viewController)

        contentView.addSubview(viewController.view)

        viewController.view.frame = contentView.bounds
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.pinToSuperviewEdges()
        viewController.didMove(toParentViewController: self)
        
        UIView.performWithoutAnimation {
            viewController.view.layoutIfNeeded()
        }
    }

    func remove(_ viewController: UIViewController) {

        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }

    func fadeFromColor(_ fromColor: UIColor, toColor: UIColor, withPercentage: CGFloat) -> UIColor {

        var fromRed: CGFloat = 0.0
        var fromGreen: CGFloat = 0.0
        var fromBlue: CGFloat = 0.0
        var fromAlpha: CGFloat = 0.0

        fromColor.getRed(&fromRed, green: &fromGreen, blue: &fromBlue, alpha: &fromAlpha)

        var toRed: CGFloat = 0.0
        var toGreen: CGFloat = 0.0
        var toBlue: CGFloat = 0.0
        var toAlpha: CGFloat = 0.0

        toColor.getRed(&toRed, green: &toGreen, blue: &toBlue, alpha: &toAlpha)

        let red = (toRed - fromRed) * withPercentage + fromRed
        let green = (toGreen - fromGreen) * withPercentage + fromGreen
        let blue = (toBlue - fromBlue) * withPercentage + fromBlue
        let alpha = (toAlpha - fromAlpha) * withPercentage + fromAlpha

        return UIColor(red: red, green: green, blue: blue, alpha: alpha)

    }

}
