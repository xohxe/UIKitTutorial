//
//  PreviewController.swift
//  UIKitTutorial
//
//  Created by 김소혜 on 11/14/23.
//

import UIKit

#if DEBUG
import SwiftUI

@available(iOS 15, *)
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        // this variable is used for injecting the current view controller
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func toPreview() -> some View {
        // inject self (the current view controller) for the preview
        Preview(viewController: self)
    }
}
#endif
