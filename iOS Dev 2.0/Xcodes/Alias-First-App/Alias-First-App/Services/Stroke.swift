//
//  Stroke.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 01.04.2021.
//

import Foundation
import UIKit

public func stroke(font: UIFont, strokeWidth: Float, insideColor: UIColor, strokeColor: UIColor) -> [NSAttributedString.Key: Any]{
    return [
        NSAttributedString.Key.strokeColor : strokeColor,
        NSAttributedString.Key.foregroundColor : insideColor,
        NSAttributedString.Key.strokeWidth : -strokeWidth,
        NSAttributedString.Key.font : font
        ]
}
