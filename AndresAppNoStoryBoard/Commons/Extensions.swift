//
//  Extensions.swift
//  AndresAppNoStoryBoard
//
//  Created by Andres Calizaya on 03/12/2021.
//

import Foundation
import UIKit

extension NSObject{
    public static func Init<Type>(value : Type, block: (_ object: Type) -> Void) -> Type { block(value)
       return value
    }
}

extension UIView{
    func fitInSuperviewSafeArea() {
       guard let sv = self.superview else { return }
       self.translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: sv.safeAreaLayoutGuide.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: sv.safeAreaLayoutGuide.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: sv.safeAreaLayoutGuide.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: sv.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    func fitInSuperview() {
       guard let sv = self.superview else { return }
       self.translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: sv.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: sv.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: sv.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: sv.rightAnchor).isActive = true
    }
}
extension String {
    func isValidEmail() -> Bool {
        let patron = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"
        let regExp = try! NSRegularExpression(pattern: patron, options: [])
        let coincidencias = regExp.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
        return coincidencias.count > 0 ? true: false
    }
    func isValidPassword() -> Bool {
        let patron = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,})"
        let regExp = try! NSRegularExpression(pattern: patron, options: [])
        let coincidencias = regExp.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
        return coincidencias.count > 0 ? true: false
    }
}
