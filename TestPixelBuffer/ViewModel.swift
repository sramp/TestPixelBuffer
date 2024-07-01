//
//  ViewModel.swift
//  TestPixelBuffer
//
//  Created by Stefano Rampazzo on 28/06/24.
//

import SwiftUI
import Accelerate
import Combine

class ViewModel: ObservableObject {
    @Published var pixelBuffer: vImage.PixelBuffer<vImage.Interleaved8x4>
    
    init() {
        let width = 100
        let height = 100
        
        pixelBuffer = vImage.PixelBuffer(width: width, height: height, pixelFormat: vImage.Interleaved8x4.self)

        pixelBuffer.withUnsafeMutableBufferPointer { bufferPtr in
            for x in 0 ..< pixelBuffer.width  {
                for y in 0 ..< pixelBuffer.height {
                 
                    let rowBytes = (pixelBuffer.rowStride * pixelBuffer.byteCountPerPixel)
                    let index = y*rowBytes + x*pixelBuffer.channelCount
                  
                    if (y < pixelBuffer.height/3) {
                        bufferPtr[index + 0] = 255 // red
                        bufferPtr[index + 1] = 0
                        bufferPtr[index + 2] = 0
                        bufferPtr[index + 3] = 0
                    } else if (y > pixelBuffer.height/3 && y < pixelBuffer.height*2/3 ) 
                    {
                        bufferPtr[index + 0] = 0
                        bufferPtr[index + 1] = 255 // green
                        bufferPtr[index + 2] = 0
                        bufferPtr[index + 3] = 0
                    } else if (y > pixelBuffer.height/2/3) {
                        bufferPtr[index + 0] = 0
                        bufferPtr[index + 1] = 0
                        bufferPtr[index + 2] = 255 // blue
                        bufferPtr[index + 3] = 0
                    }
                    
                }
            }
        }
}
}

 
