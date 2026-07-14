//
//  RegisterViewControllerWrapper.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-07-14.
//

import UIKit
import SwiftUI

struct RegisterViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> RegisterViewController {
        RegisterViewController()
    }
    
    func updateUIViewController(_ uiViewController: RegisterViewController, context: Context) {
        // nothing needed here
    }
}
