//
//  ContentView.swift
//  TestPixelBuffer
//
//  Created by Stefano Rampazzo on 28/06/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : ViewModel = ViewModel()
    var body: some View {
        VStack {
            PixelBufferView(viewModel: ViewModel())
            Text("Hello, vImage.PixelBuffer")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
