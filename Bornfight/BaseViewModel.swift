//
//  BaseViewModel.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

public typealias EmptyCallback = () -> Void

class BaseViewModel {
    var onComplete: EmptyCallback?
    var onError: ((String) -> Void)?
    var onShowAlertMessage: ((String, String) -> Void)?
}
