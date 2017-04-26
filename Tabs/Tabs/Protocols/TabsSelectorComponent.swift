import UIKit
import Foundation

protocol TabsSelectorComponent {

    var height: CGFloat { get }
    var viewController: UIViewController { get }
    weak var delegate: TabsSelectorDelegate? { get set }
}
