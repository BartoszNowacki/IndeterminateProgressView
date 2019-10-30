//
//  IndeterminateProgressView.swift
//  IndeterminateProgressView
//
//  Created by Bartosz Nowacki on 29/10/2019.
//  Copyright © 2019 Bartosz Nowacki. All rights reserved.
//

import UIKit

@IBDesignable open class IndeterminateProgressView: UIProgressView {
    
    /// This type tells Progress View to work as indeterminate Progress View (it works similar to Android Indeterminate ProgressView), or determinate (which is the normal UIProgressView)
    public enum ProgressType: String {
        case determinate = "determinate"
        case indeterminate = "indeterminate"
    }
    open var type = ProgressType.determinate {
        didSet {
            if type == ProgressType.determinate {
                stopIndeterminateProgress()
            }
        }
    }
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable open var progressType: String? {
        willSet {
            if let newType = ProgressType(rawValue: newValue?.lowercased() ?? "") {
                type = newType
            }
        }
    }
    private let indeterminateLine: UIView = UIView()
    
    private var isAnimationOn: Bool = false
    
    /// This function will be called only for determinate Progress View.
    override open func setProgress(_ progress: Float, animated: Bool) {
        if type == .determinate {
            super.setProgress(progress, animated: animated)
        }
    }
    
    /// This function will be called only for indeterminate Progress View. It's starting animation of ProgressView.
    open func startIndeterminateProgress() {
        if type == .indeterminate, !isAnimationOn {
            setupIndeterminate()
            super.setProgress(0, animated: false)
            isAnimationOn = true
            animateIndeterminateFirstStage()
        }
    }
    
    /// This function stops animation of Indeterminate ProgressView
    open func stopIndeterminateProgress() {
        isAnimationOn = false
    }
    
    private func setupIndeterminate() {
        self.addSubview(indeterminateLine)
        indeterminateLine.backgroundColor = progressTintColor
        indeterminateLine.clipsToBounds = true
        self.clipsToBounds = true
        indeterminateLine.frame = CGRect(x: 0, y: 0, width: 0, height: self.frame.height)
    }
    
    private func animateIndeterminateFirstStage() {
        indeterminateLine.frame = CGRect(x: 0, y: 0, width: 0, height: self.frame.height)
        UIView.animate(withDuration: 1.5, delay: 0, options: [.curveLinear], animations: {
            self.indeterminateLine.frame = CGRect(x: self.frame.width, y: 0, width: self.frame.width, height: self.frame.height)
        }) {_ in
            if self.isAnimationOn {
                self.animateIndeterminateSecondStage()
            }
        }
    }
    
    private func animateIndeterminateSecondStage() {
        isAnimationOn = self.window != nil
        indeterminateLine.frame = CGRect(x: 0, y: 0, width: 0, height: self.frame.height)
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
            self.indeterminateLine.frame = CGRect(x: 0, y: 0, width: self.frame.width/3*2, height: self.frame.height)
        }) {_ in
            if self.isAnimationOn {
                self.animateIndeterminateThirdStage()
            }
        }
    }
    
    private func animateIndeterminateThirdStage() {
        isAnimationOn = self.window != nil
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear], animations: {
            self.indeterminateLine.frame = CGRect(x: self.frame.width, y: 0, width: self.frame.width/3, height: self.frame.height)
        }) {_ in
            if self.isAnimationOn {
                self.animateIndeterminateFirstStage()
            }
        }
    }
}

