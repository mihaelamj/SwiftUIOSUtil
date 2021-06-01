import XCTest
@testable import SwiftUIOSUtil
import SwiftUI
import ViewInspector

final class SwiftUIOSUtilTests: XCTestCase {
  
  func testPlatformModifiers() throws {
    
    struct TestView: View, Inspectable {
      var text: String
      var backgroundColor: Color
      var myPadding: CGFloat
      
      var body: some View {
        VStack {
          Text(text)
            .font(.headline)
            .padding(myPadding)
            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(backgroundColor))
            .foregroundColor(Color.black)
        }
        .modify {
          #if os(iOS)
          $0.padding(.bottom, 40)
          #else
          $0.padding(.bottom, 50)
          #endif
        }
      }
    }
    
    let testView = TestView(text: "TestView", backgroundColor: .red, myPadding: 30)
    let vStack = try testView.inspect().vStack()
    XCTAssertNotNil(vStack)
    
    let vStackPadding = try vStack.padding()
    XCTAssertNotNil(vStackPadding)
    
    #if os(iOS)
    XCTAssertEqual(vStackPadding.bottom, 40)
    #else
    XCTAssertEqual(vStackPadding.bottom, 50)
    #endif
  }
  
}
