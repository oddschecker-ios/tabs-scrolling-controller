import Foundation
import CoreGraphics

protocol TabsComponentDataSource: class {

    func collapsedTopOffset() -> CGFloat
    func heightForTopComponent() -> CGFloat
}
