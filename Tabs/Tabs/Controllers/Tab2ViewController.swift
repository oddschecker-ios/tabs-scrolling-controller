
import UIKit

class Tab2ViewController: UIViewController {

    weak var delegate: TabScrollViewControllerDelegate?

}

extension Tab2ViewController: TabChildComponent {

    var viewController: UIViewController {
        return self
    }
    
}
