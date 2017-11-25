//
//  SomoDefines.h
//  SomoDemo
//
//  Created by 向小辉 on 2017/11/25.
//  Copyright © 2017年 KINX. All rights reserved.
//

#ifndef SomoDefines_h
#define SomoDefines_h

#define UIColorFromRGBA(rgbValue, alphaValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#define UIColorFromRGB(rgbValue)   UIColorFromRGBA(rgbValue, 1.0)

#define SomoColorFromRGBA(R, G, B, A) \
[UIColor  colorWithRed:(R)/255.0 \
green:(G)/255.0 \
blue:(B)/255.0 \
alpha:1.0]

#define SomoColorFromRGB(R, G, B)		SomoColorFromRGBA(R, G, B, 1.0)
#define SomoColorFromRGBV(V)		SomoColorFromRGBA(V, V, V, 1.0)


#endif /* SomoDefines_h */
