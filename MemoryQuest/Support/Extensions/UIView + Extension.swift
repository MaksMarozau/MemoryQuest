import UIKit.UIView

extension UIView {
    
    func addSubviews(for views: UIView...) {
        views.forEach( { addSubview($0) } )
    }
}
