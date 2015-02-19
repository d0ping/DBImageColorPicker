//
//  DBImageColorPicker.m
//  DBImageColorPicker
//
//  Created by Denis Bogatyrev on 17.08.14.
//  Copyright (c) 2014 DenisBogatyrev. All rights reserved.
//

#import "DBImageColorPicker.h"
#import "UIImage+Color.h"

@interface DBImageColorPicker ()

@property (nonatomic, readwrite) UIColor        *backgroundColor;
@property (nonatomic, readwrite) UIColor        *primaryTextColor;
@property (nonatomic, readwrite) UIColor        *secondaryTextColor;

@end

@implementation DBImageColorPicker

- (id)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.primaryTextColor = [UIColor whiteColor];
        self.secondaryTextColor = [UIColor lightGrayColor];
    }
    return self;
}

- (id)initFromImage:(UIImage *)image withBackgroundType:(DBImageColorPickerBackgroundType)backgroundType {
    self = [super init];
    if (self) {
        self.backgroundType = backgroundType;
        self.image = image;
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    if (_image != image) {
        _image = image;
        
        switch (_backgroundType) {
            case DBImageColorPickerBackgroundTypeHeaderSide:
                self.backgroundColor = [image headerAverageColor];
                break;
            case DBImageColorPickerBackgroundTypeFooterSide:
                self.backgroundColor = [image footerAverageColor];
                break;
            default:
                self.backgroundColor = [image averageColor];
                break;
        }
        self.primaryTextColor = [image primaryColorFromBackgroundColor:_backgroundColor];
        self.secondaryTextColor = [image secondaryColorFromBackgroundColor:_backgroundColor primaryColor:_primaryTextColor];
    }
}

@end
