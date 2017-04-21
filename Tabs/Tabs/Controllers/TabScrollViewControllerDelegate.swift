
import Foundation
import CoreGraphics

protocol TabScrollViewControllerDelegate: class {

    func scrollDidScroll(offset: CGFloat)
    func heightForTopComponent() -> CGFloat
}
