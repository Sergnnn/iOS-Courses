//
//  ViewController.swift
//  Test_01
//
//  Created by Сергей Непомящий on 24.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iphoneNameLabel: UILabel!
    @IBOutlet weak var iphoneColorLabel: UILabel!
    @IBOutlet weak var iphonePriceLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appleProduct = AppleProduct(name: "iPhone X", color: "Gold", price: 799.99)
        
        
        iphoneNameLabel.text = appleProduct.name
        iphoneColorLabel.text = "in \(appleProduct.color)"
        iphonePriceLabel.text = "$\(appleProduct.price)"
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))

            // you will probably want to set the font (remember to use Dynamic Type!)
            label.font = UIFont.preferredFont(forTextStyle: .footnote)

            // and set the text color too - remember good contrast
            label.textColor = .black

            // may not be necessary (e.g., if the width & height match the superview)
            // if you do need to center, CGPointMake has been deprecated, so use this
            label.center = CGPoint(x: 160, y: 284)

            // this changed in Swift 3 (much better, no?)
            label.textAlignment = .left

            label.text = "I am a test label"

            self.view.addSubview(label)
    }


}

