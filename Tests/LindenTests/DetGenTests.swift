import XCTest
@testable import Linden

final class DetGenTests: XCTestCase {
    static var allTests = [
        ("testGenerationZeroReturnsAxiom", testGenerationZeroReturnsAxiom),
        ("testGenReturnsNewString", testGenReturnsNewString),
        ("testGenBuildsFractalTree", testGenBuildsFractalTree),
    ]
    
    func testGenerationZeroReturnsAxiom() {
        XCTAssertEqual(DetGen(axiom: "A", rules: [:]).gen(n: 0), "A")
    }
    
    func testGenReturnsNewString() {
        let tests = [
            (1, "AB"),
            (2, "ABA"),
            (3, "ABAAB"),
            (4, "ABAABABA"),
            (5, "ABAABABAABAAB"),
            (6, "ABAABABAABAABABAABABA"),
            (7, "ABAABABAABAABABAABABAABAABABAABAAB"),
        ]
        
        let g = DetGen(axiom: "A", rules: [
            "A": "AB",
            "B": "A"
        ])
        
        for (n, expected) in tests {
            XCTAssertEqual(g.gen(n: n), expected)
        }
    }
    
    func testGenBuildsFractalTree() {
        let tests = [
            (0, "0"),
            (1, "1[0]0"),
            (2, "11[1[0]0]1[0]0"),
            (3, "1111[11[1[0]0]1[0]0]11[1[0]0]1[0]0"),
        ]
        
        let g = DetGen(axiom: "0", rules: [
            "1": "11",
            "0": "1[0]0"
        ])
        
        for (n, expected) in tests {
            XCTAssertEqual(g.gen(n: n), expected)
        }
    }
}
