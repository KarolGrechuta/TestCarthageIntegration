//
//  KGToastPresenter.h
//  CaInTe
//
//  Created by Karol Grechuta on 25.05.2017.
//  Copyright © 2017 KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KGToastPresenter : NSObject

+ (instancetype)sharedPresenter;
- (void)showToastInViewController:(UIViewController *)viewController;

@end
