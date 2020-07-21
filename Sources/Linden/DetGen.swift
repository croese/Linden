//
//  DetGen.swift
//  Linden
//
//  Created by Christian Roese on 7/20/20.
//

import Foundation

public class DetGen {
    
    private let axiom: String
    private let rules: [Character: String]
    
    public init(axiom: String, rules: [Character: String]) {
        self.axiom = axiom
        self.rules = rules
    }
    
    public func gen(n: Int) -> String {
        if n <= 0 {
            return axiom
        }
        
        var result = axiom
        
        for _ in 1...n {
            result = result.map { (c) -> String in
                if let sub = self.rules[c] {
                    return sub
                }
                return String(c)
            }.joined()
        }
        
        return result
    }
}
