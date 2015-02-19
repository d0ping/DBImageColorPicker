//
//  ViewController.m
//  DBImageColorPickerExample
//
//  Created by Denis Bogatyrev on 19.02.15.
//  Copyright (c) 2015 Denis Bogatyrev. All rights reserved.
//

#import "ViewController.h"
#import "DBImageColorPicker.h"

@interface ViewController ()

@property (nonatomic, strong) DBImageColorPicker        *colorPicker;

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    [self addImageViewObserver];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"img_00012"];
    _colorPicker = [[DBImageColorPicker alloc] initFromImage:image withBackgroundType:DBImageColorPickerBackgroundTypeFooterSide];
    _imageView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [self removeImageViewObserver];
}

#pragma mark - Images

- (void)changeImage {
    NSInteger imageNum = arc4random()%31 +1;
    NSLog(@"%zd", imageNum);
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"img_%05zd", imageNum]];
    _imageView.image = image;
}

#pragma mark - Colors

- (void)updateColorWithAnimated:(BOOL)animated {
    const float duration = 1.5f;
    __weak __typeof(self) weakSelf = self;
    void (^animationBlock)()  = ^{
        weakSelf.view.backgroundColor = _colorPicker.backgroundColor;
        weakSelf.titleLabel.textColor = _colorPicker.primaryTextColor;
        weakSelf.subtitleLabel.textColor = _colorPicker.secondaryTextColor;
    };
    
    if (animated) {
        [UIView animateWithDuration:duration
                         animations:animationBlock];
    } else {
        animationBlock();
    }
}

#pragma mark - Observering

- (void)addImageViewObserver {
    [_imageView addObserver:self forKeyPath:NSStringFromSelector(@selector(image)) options:NSKeyValueObservingOptionOld context:nil];
}

- (void)removeImageViewObserver {
    [_imageView removeObserver:self forKeyPath:NSStringFromSelector(@selector(image))];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isKindOfClass:[_imageView class]]) {
        if ([keyPath isEqualToString:NSStringFromSelector(@selector(image))]) {
            _colorPicker.image = _imageView.image;
            [self updateColorWithAnimated:YES];
        }
    }
}


@end
