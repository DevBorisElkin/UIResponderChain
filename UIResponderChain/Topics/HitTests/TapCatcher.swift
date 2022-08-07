//
//  TapCatcher.swift
//  UIResponderChain
//
//  Created by test on 06.08.2022.
//

import Foundation
import UIKit

// https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/handling_uikit_gestures/handling_tap_gestures

// https://developer.apple.com/documentation/uikit/uiview/1622469-hittest

//  Useful https://stackoverflow.com/questions/4961386/event-handling-for-ios-how-hittestwithevent-and-pointinsidewithevent-are-r

// Good video about pattern
// https://www.youtube.com/watch?v=le7tzeqN908&t=291s&ab_channel=SwiftArcade


class TapCatcher: UIView {
    
    var colors: [UIColor] = {
        return [#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]
    }()
    var selectedColor = 0
    
    func changeColor() {
        selectedColor += 1
        if(selectedColor >= colors.count){
            selectedColor = 0
        }
        backgroundColor = colors[selectedColor]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        print("View was created")
        //changeColor()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapWasMade(_:)))
        gestureRecognizer.numberOfTapsRequired = 1
        addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func tapWasMade(_ gesture: UITapGestureRecognizer){
        //print("tap was made \(gesture.location(in: gesture.view))")
        changeColor()
    }
    
    // func point() calculates, whether touch was inside of the view's bounding box or not
    // func hitTest() checks, from root layer(farthes from touch), checks up recursivley, on the same layer from bottom to the top, moving deeply in each child view, to determine, which of views that point() fuction 'marked' as the ones that are eligible for touch, which one of them is the closest to the screen and therefore eligible for touch
    // if 2 views are eligible for touch and will be on the same layer, the most bottom view will be in priority since this view is rendered above the second view (second view will be rendered on the back of the first view and in calculatins will be considered as the one on the back)
    // by the way also it consideres the most bottom views first because this approach is more effiient (takes less calculations)
    
    
    // Use code below in point() fuction to increase tap area of UIView by declared below offsets for each side
//    let touchOffset = CGPoint(x: 50, y: 50)
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        return bounds.insetBy(dx: -touchOffset.x, dy: -touchOffset.y).contains(point)
//    }
    // Use code below to ignore touches to all child views of this view
    // also note: hitTest() -> you can return self of view so clicks will always fall into that view and ignore child views
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        return self
//    }
    
    
    // __________________________________________________________________________________________
    
    // MARK: OTHER EXAMPLES:
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("hit test")
        var hitTestResult = super.hitTest(point, with: event)
        //print("hitTest: \(point), \(hitTestResult)")
        //print("hitTest: \(point)")
        return hitTestResult
    }
//    
//    //let touchOffset = CGPoint(x: 50, y: 50)
//
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        //print("_____")
        print("point: \(point)")
        var result = super.point(inside: point, with: event)
        //var string = result ? "UIView was hit" : "Didn't hit the view"
        //print(string)
        //print("frame: \(frame), bounds: \(bounds)")
        //return bounds.insetBy(dx: -touchOffset.x, dy: -touchOffset.y).contains(point)
        //print("point(\(point), event(\(event)) -> \(result)")

        //print("poin result: \(result)")
        
        return result
    }
    
    // touches began travells through views.
    // View (and other views, from top to bottom)-> UIViewController -> UIWindow -> UIApplication? -> AppDelegate
    // to the final view via UI Responder Chain pattern
    // the same thing with touches ended (also travells through views hierarchy), however, there's a time limit for user to lift up touch before tap gets discarded
    // however, this thing is not related to hitTest(), point() and tapGestureRecognizer. Commenting out super.touchesBegan() will stop call-flow of this event down the views hierarchy. All the affected views(by hit tests apparently) wil have this method called
    // by default all views implement passing of this event, however, they do it implicitly (you need to override method calls in different views and add comments to see it)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TapCatcher.touchesBegan()")
        super.touchesBegan(touches, with: event)
    }
//
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches ended")
        super.touchesEnded(touches, with: event)
    }
}

//extension UIView {
//    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("View.touchesBegan()")
//        super.touchesBegan(touches, with: event)
//    }
//}

extension UIApplication {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIApplication.touchesBegan()")
        super.touchesBegan(touches, with: event)
    }
}

extension UIWindow {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIWindow.touchesBegan()")
        super.touchesBegan(touches, with: event)
    }
}
