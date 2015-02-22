//
//  ViewController.h
//  DBImageColorPickerExample
//
//  Created by Denis Bogatyrev on 19.02.15.
//  Copyright (c) 2015 Denis Bogatyrev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView            *imageView;
@property (nonatomic, weak) IBOutlet UILabel                *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel                *subtitleLabel;
@property (nonatomic, weak) IBOutlet UILabel                *clickPromptLabel;

@end

