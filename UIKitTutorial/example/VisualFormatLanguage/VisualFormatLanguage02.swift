//
//  VisualFormatLanguage02.swift
//  UIKitTutorial
//
//  Created by 김소혜 on 11/14/23.
//

import UIKit

class VisualFormatLanguage02: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func createVisualFormatLayout() {
        let superview = self.view!

        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)

        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenView)

        // 뷰 사전 생성
        let viewsDict = ["leftView": redView, "rightView": greenView]

        // 수직 제약 조건 생성 및 추가
        let vConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-50-[leftView(50)]",
            metrics: nil, views: viewsDict)

        let vRightConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-50-[rightView(50)]",
            metrics: nil, views: viewsDict)

        // 수평 제약 조건 생성 및 추가
        let hConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "|-10-[leftView(200@50)]-10-[rightView(100@40)]-10-|",
            metrics: nil, views: viewsDict)

        NSLayoutConstraint.activate( vConstraint + hConstraint + vRightConstraint)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

#if DEBUG
import SwiftUI

@available(iOS 16.0, *)
struct VisualFormatLanguage02Preview: PreviewProvider {
       
   static var devices = ["iPhone 15","iPhone SE"]

   static var previews: some View {
       ForEach(devices, id: \.self) { deviceName in
           UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VisualFormatLanguage02")
               .toPreview()
               .previewDevice(PreviewDevice(rawValue: deviceName))
               .previewDisplayName(deviceName)
       }
   }
}
#endif




