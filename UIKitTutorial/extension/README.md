# UIKit에서 Preview 사용하기

SwiftUI에서는 프리뷰를 코드를 짜면서 바로 볼 수 있지만, UIKit에서는 시뮬레이터를 돌려야 변화를 볼 수 있습니다.
UIKit에서도 Preview를 사용하기 위해 Extensions을 만들었습니다.

## 📌 Extension 사용법

### 01. 전체 페이지를 보고싶을 때

`PreviewController.swift` 

필요할 때 toPreview() 메서드를 호출해서 사용하면된다.


### 02. UIView 나 Cell을 미리보고 싶을 때

`PreviewUICellController.swift` 

UIView나 셀 단위 작업 시 사용하면 좋습니다.

```swift

#if DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct BorderedButton_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let button = MyBaseButton(frame: .zero)
            button.setTitle("Follow", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            return button

        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif


```
 
 
## 참고문서
[Use Xcode Previews with UIKit](https://fluffy.es/xcode-previews-uikit/)
