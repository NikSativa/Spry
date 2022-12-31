import Foundation
import XCTest

/// Matcher used to determine if at least one call has been made.
///
/// - Important: This function respects `resetCalls()`. If calls have been made, then afterward `resetCalls()` is called. It is expected that hasRecordedCalls to be false.
@inline(__always)
public func XCTAssertHaveRecordedCalls<T: Spryable>(_ spyable: T,
                                                    file: StaticString = #filePath,
                                                    line: UInt = #line) {
    XCTAssertTrue(!spyable._callsDictionary.calls.isEmpty,
                  descriptionOfActual(count: spyable._callsDictionary.calls.count),
                  file: file,
                  line: line)
}

/// Matcher used to determine if at least one call has been made.
///
/// - Important: This function respects `resetCalls()`. If calls have been made, then afterward `resetCalls()` is called. It is expected that hasRecordedCalls to be false.
@inline(__always)
public func XCTAssertHaveRecordedCalls<T: Spryable>(_ spyable: T.Type,
                                                    file: StaticString = #filePath,
                                                    line: UInt = #line) {
    XCTAssertTrue(!spyable._callsDictionary.calls.isEmpty,
                  descriptionOfActual(count: spyable._callsDictionary.calls.count),
                  file: file,
                  line: line)
}

// MARK: - Private Helpers

@inline(__always)
private func descriptionOfActual(count: Int) -> String {
    let pluralism = count == 1 ? "" : "s"
    return "have recorded \(count) call\(pluralism)"
}
