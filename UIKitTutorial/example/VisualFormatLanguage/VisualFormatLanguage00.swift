//
//  VisualFormatLanguage00.swift
//  UIKitTutorial
//
//  Created by 김소혜 on 11/14/23.
//
 
import UIKit

class VisualFormatLanguage00: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createVisualFormatLayout()
    }
        
    func createVisualFormatLayout() {
        let superview = self.view!

        let myLabel = UILabel()
        myLabel.text = "My Label"
        myLabel.translatesAutoresizingMaskIntoConstraints = false

        let myButton = UIButton()
        myButton.setTitle("My Button", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.translatesAutoresizingMaskIntoConstraints = false

        superview.addSubview(myLabel)
        superview.addSubview(myButton)

        // 뷰 사전 생성
        let viewsDict = ["myLabel": myLabel, "myButton": myButton]

        // 수직 제약 조건 생성 및 추가
        let btnConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[myButton]-|", metrics: nil, views: viewsDict)

        // 수평 제약 조건 생성 및 추가
        let btnAndlabelConst = NSLayoutConstraint.constraints(
            withVisualFormat: "|-[myButton]-[myLabel(==myButton)]-|",
            options: NSLayoutConstraint.FormatOptions.alignAllLastBaseline,
            metrics: nil, views: viewsDict)

        NSLayoutConstraint.activate( btnConstraint + btnAndlabelConst )
    }
 
}



#if DEBUG
import SwiftUI

@available(iOS 16.0, *)
struct VisualFormatLanguage00Preview: PreviewProvider {
        
    static var devices = ["iPhone 15","iPhone SE"]

    static var previews: some View {
        ForEach(devices, id: \.self) { deviceName in
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VisualFormatLanguage00")
                .toPreview()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif

 
