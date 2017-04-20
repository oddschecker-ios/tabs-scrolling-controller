
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
    
}
