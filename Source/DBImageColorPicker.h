//
//  DBImageColorPicker.h
//  DBImageColorPicker
//
//  Created by Denis Bogatyrev on 17.08.14.
//  Copyright (c) 2014 DenisBogatyrev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DBImageColorPickerBackgroundType) {
    DBImageColorPickerBackgroundTypeDefault = 0,
    DBImageColorPickerBackgroundTypeHeaderSide,
    DBImageColorPickerBackgroundTypeFooterSide,
};

@interface DBImageColorPicker : NSObject

@property (nonatomic, strong) UIImage                           *image;
@property (nonatomic, assign) DBImageColorPickerBackgroundType  backgroundType;

// You can observing this properties
@property (nonatomic, readonly) UIColor                         *backgroundColor;
@property (nonatomic, readonly) UIColor                         *primaryTextColor;
@property (nonatomic, readonly) UIColor                         *secondaryTextColor;

- (id)initFromImage:(UIImage *)image withBackgroundType:(DBImageColorPickerBackgroundType)backgroundType;

@end
