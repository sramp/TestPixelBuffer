//
//  PixelBufferView.swift
//  TestPixelBuffer
//
//  Created by Stefano Rampazzo on 28/06/24.
//

import SwiftUI
import Accelerate
import Combine

struct PixelBufferView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        if let cgImage = createImage(from:viewModel.pixelBuffer) {
            Image(cgImage, scale: 1.0, label: Text("Test Image"))
        } else {
            Text("Failed to create image")
        }
    }
    
    func createImage(from buffer: vImage.PixelBuffer<vImage.Interleaved8x4>) -> CGImage? {

        let format = vImage_CGImageFormat(bitsPerComponent: 8,
                                       bitsPerPixel: 8 * 4,
                                       colorSpace: CGColorSpaceCreateDeviceRGB(),
                                       bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.noneSkipLast.rawValue))!

       return buffer.makeCGImage(cgImageFormat: format)
    }

}

