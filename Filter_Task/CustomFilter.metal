//
//  CustomFilter.metal
//  Filter_Task
//
//  Created by user on 20/08/2023.
//

#include <metal_stdlib>
using namespace metal;
#include <CoreImage/CoreImage.h> // includes CIKernelMetalLib.h

extern "C" { namespace coreimage {
    
    float4 filter1(sample_t sample, float threshold) {
          float4 filtered = (sample.r < threshold && sample.g < threshold && sample.b < threshold) == true ? float4(0):float4(sample.r, sample.g, sample.b, sample.a);
          return filtered;
      }
    
    float4 filter2(sample_t s) {
        return s.gabr;
    }
    
    float4 filter3(sample_t s) {
        return s.bgra;
    }

    float4 filter4(sample_t s) {
        return s.rbga;
    }
    
    float4 filter5(sample_t s) {
        return s.brga;
    }
    


}}
