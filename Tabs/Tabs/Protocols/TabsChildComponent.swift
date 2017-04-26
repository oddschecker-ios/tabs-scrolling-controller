import UIKit
import Foundation

protocol TabsChildComponent {

    var viewController: UIViewController { get }
    weak var tabsDelegate: TabsComponentDelegate? { get set }
    weak var tabsDataSource: TabsComponentDataSource? { get set }

    func reset()
}
