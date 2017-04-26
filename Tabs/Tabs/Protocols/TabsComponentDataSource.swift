import Foundation
import CoreGraphics

protocol TabsComponentDataSource: class {

    func heightForTopComponent() -> CGFloat
    func collapsedTopOffset() -> CGFloat
}
