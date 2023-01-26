//
//  Result.swift
//  NcloudChat
//
//  Created by Han Dole Kim on 1/23/23.
//

import Foundation


@frozen public enum CustomResult<Success, Failure> where Failure : Error {
    /// A success, storing a `Success` value.
    case success(Success)

    /// A failure, storing a `Failure` value.
    case failure(Failure)
}
