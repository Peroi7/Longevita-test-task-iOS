//
//  RangeExtensions.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 17/06/2024.
//

import Foundation

infix operator !~=: ComparisonPrecedence

//MARK: - RangeExpression

extension RangeExpression {
    static func !~=(lhs: Self, rhs: Bound) -> Bool {
        return !(lhs ~= rhs)
    }
}
