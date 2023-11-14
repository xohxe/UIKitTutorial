//
//  VisualFormatLanguage01.swift
//  UIKitTutorial
//
//  Created by 김소혜 on 11/14/23.
//
//
import UIKit

class VisualFormatLanguage01: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createVisualFormatLayout()
        // Do any additional setup after loading the view.
    }
    
    
    func createVisualFormatLayout() {
            let superview = self.view!

            let myLabel = UILabel()
            myLabel.text = ""
            myLabel.backgroundColor = UIColor.gray
            myLabel.translatesAutoresizingMaskIntoConstraints = false

            let myImage = UIImageView()
            myImage.image = UIImage(named: "album__22")
            myImage.contentMode = .scaleAspectFit
            myImage.translatesAutoresizingMaskIntoConstraints = false

            superview.addSubview(myLabel)
            superview.addSubview(myImage)

            // 뷰 사전 생성
            let viewsDict = ["myLabel": myLabel, "myImage": myImage]

            // 수직 제약 조건 생성 및 추가
            let vConstraint = NSLayoutConstraint.constraints(
                withVisualFormat: "V:[myImage(200)]", metrics: nil, views: viewsDict)

            // 수평 제약 조건 생성 및 추가
            let hConstraint = NSLayoutConstraint.constraints(
                withVisualFormat: "[myLabel]-[myImage(200)]", options: [.alignAllCenterY],
                metrics: nil, views: viewsDict)

            let vlabelConst = NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-[myLabel]-|",
                metrics: nil, views: viewsDict)

            let centerXConst = NSLayoutConstraint(item: myImage, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0.0)

            let centerYConst = NSLayoutConstraint(item: myImage, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: 0.0)

            NSLayoutConstraint.activate( vConstraint + hConstraint + vlabelConst ) // + [centerXConst, centerYConst])
        }
 

}
 
#if DEBUG
import SwiftUI

@available(iOS 16.0, *)
struct VisualFormatLanguage01Preview: PreviewProvider {
        
    static var devices = ["iPhone 15","iPhone SE"]

    static var previews: some View {
        ForEach(devices, id: \.self) { deviceName in
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VisualFormatLanguage01")
                .toPreview()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif

 

 
