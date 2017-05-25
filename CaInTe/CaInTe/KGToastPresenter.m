//
//  KGToastPresenter.m
//  CaInTe
//
//  Created by Karol Grechuta on 25.05.2017.
//  Copyright © 2017 KG. All rights reserved.
//

#import "KGToastPresenter.h"

@interface KGToastPresenter ()

@end

@implementation KGToastPresenter

+ (instancetype)sharedPresenter
{
    static KGToastPresenter *presenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        presenter = [self new];
    });
    
    return presenter;
}

- (void)showToastInViewController:(UIViewController *)viewController
{
    CGRect screenFrame = [UIScreen mainScreen].bounds;
    UIView *view = [[UIView alloc] initWithFrame:(CGRect){CGPointZero, screenFrame.size.width * 0.25f, screenFrame.size.height * 0.25f}];
    view.center = (CGPoint){screenFrame.size.width * (1 + arc4random_uniform(3)) * 0.25f, screenFrame.size.height * (1 + arc4random_uniform(3)) * 0.25f};
    view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(10) * 0.1f
                                           green:arc4random_uniform(10) * 0.1f
                                            blue:arc4random_uniform(10) * 0.1f
                                           alpha:1.0f];
    [viewController.view addSubview:view];
    __weak typeof(view) weakView = view;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakView removeFromSuperview];
    });
}

@end
