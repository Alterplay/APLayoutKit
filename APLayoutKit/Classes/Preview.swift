//
//  Preview.swift
//  APLayoutKit
//
//  Created by Vladislav Sosiuk on 28.10.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct Preview: View {
    
    private let factory: () -> UIView
    
    public init(factory: @escaping () -> UIView) {
        self.factory = factory
    }
    
    public var body: some View {
        Renderer(factory)
    }
    
    private struct Renderer: UIViewRepresentable {
        private let factory: () -> UIView
        
        init(_ factory: @escaping () -> UIView) {
            self.factory = factory
        }
        
        func makeUIView(context: Context) -> UIView {
            factory()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
            // empty
        }
    }
}
