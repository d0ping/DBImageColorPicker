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
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadNextImage)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [self getRandomImage];
    _colorPicker = [[DBImageColorPicker alloc] initFromImage:image withBackgroundType:DBImageColorPickerBackgroundTypeFooterSide];
    _imageView.image = image;
}

- (void)dealloc {
    [self removeImageViewObserver];
}

#pragma mark - Images

- (UIImage *)getRandomImage {
    NSInteger imageNum = arc4random()%31 +1;
    return [UIImage imageNamed:[NSString stringWithFormat:@"img_%05zd", imageNum]];
}

- (void)loadNextImage {
    [self setImage:[self getRandomImage] withTransition:YES];
}

- (void)setImage:(UIImage *)image withTransition:(BOOL)transition {
    NSTimeInterval duration = 1.f;
    __weak __typeof(self) weakSelf = self;
    
    void (^animationBlock)()  = ^{
        weakSelf.imageView.image = image;
    };
    
    if (transition) {
        [UIView transitionWithView:_imageView
                          duration:duration
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:animationBlock
                        completion:nil];
    } else {
        animationBlock();
    }
}

#pragma mark - Colors

- (void)updateColorWithAnimated:(BOOL)animated {
    const float duration = 1.f;
    __weak __typeof(self) weakSelf = self;
    if (animated) {
        [UIView transitionWithView:_titleLabel
                          duration:duration
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            weakSelf.titleLabel.textColor = _colorPicker.primaryTextColor;
                        }
                        completion:nil];
        [UIView transitionWithView:_subtitleLabel
                          duration:duration
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            weakSelf.subtitleLabel.textColor = _colorPicker.secondaryTextColor;
                        }
                        completion:nil];
        [UIView animateWithDuration:duration
                         animations:^{
                             weakSelf.view.backgroundColor = _colorPicker.backgroundColor;
                         }];
    } else {
        _titleLabel.textColor = _colorPicker.primaryTextColor;
        _subtitleLabel.textColor = _colorPicker.secondaryTextColor;
        self.view.backgroundColor = _colorPicker.backgroundColor;
    }
}

#pragma mark - Observering

- (void)addImageViewObserver {
    [_imageView addObserver:self forKeyPath:NSStringFromSelector(@selector(image)) options:NSKeyValueObservingOptionInitial context:nil];
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
