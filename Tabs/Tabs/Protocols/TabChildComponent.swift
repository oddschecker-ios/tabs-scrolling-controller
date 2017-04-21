
import Foundation
import UIKit

protocol TabChildComponent {
    var viewController: UIViewController { get }
    weak var delegate: TabScrollViewControllerDelegate? { get set }

    func updateInset(inset: UIEdgeInsets)
}
