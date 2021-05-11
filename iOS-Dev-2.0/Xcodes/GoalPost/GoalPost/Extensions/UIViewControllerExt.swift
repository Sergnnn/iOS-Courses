//
//  UIViewControllerExt.swift
//  GoalPost
//
//  Created by Сергей Непомящий on 23.01.2021.
//

import UIKit

extension UIViewController {
    
    
    func presentDetail(_ VCTopresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        VCTopresent.modalPresentationStyle = .fullScreen
        present(VCTopresent, animated: false, completion: nil)
        
    }
    
    func preentSecondaryDetail(_ viewControllerToPresent: UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        
        guard let presentedViewContorller = presentedViewController else {return}
    
        
        presentedViewContorller.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            
            
            viewControllerToPresent.modalPresentationStyle = .fullScreen
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
