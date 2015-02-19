//
//  UIImage+Color.h
//  DBImageColorPicker
//
//  Created by Denis Bogatyrev on 24.01.15.
//  Copyright (c) 2015 DenisBogatyrev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

- (UIColor *)averageColor;
- (UIColor *)headerAverageColor;
- (UIColor *)footerAverageColor;
- (UIColor *)primaryColorFromBackgroundColor:(UIColor *)backgroundColor;
- (UIColor *)secondaryColorFromBackgroundColor:(UIColor *)backgroundColor primaryColor:(UIColor *)primaryColor;
- (UIColor *)lighterColorForColor:(UIColor *)sourceColor;

@end
