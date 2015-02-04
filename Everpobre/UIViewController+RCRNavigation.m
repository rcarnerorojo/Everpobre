//
//  UIViewController+RCRNavigation.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "UIViewController+RCRNavigation.h"

@implementation UIViewController (RCRNavigation)

-(UINavigationController *) rcrWrapperInNavigation{
    
    UINavigationController * nav = [UINavigationController new];
    [nav pushViewController:self
                   animated:NO];
    return nav;
}

@end
