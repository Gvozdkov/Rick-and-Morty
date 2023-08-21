//
//  UIColor.swift
//  Rick and Morty
//
//  Created by Алексей Гвоздков on 20.08.2023.
//

import UIKit

extension UIColor {
    static var darkBlue: UIColor { UIColor(named: "blackBlue") ?? UIColor.blue }
    static var grayBlue: UIColor { UIColor(named: "grayBlue") ?? UIColor.darkGray }
    static var brightGreen: UIColor { UIColor(named: "brightGreen") ?? UIColor.green }
}
