
import UIKit

class TopViewController: UIViewController, TabsTopComponent {

    var height: CGFloat {
        return 300
    }

    var viewController: UIViewController {
        return self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
    }
}
