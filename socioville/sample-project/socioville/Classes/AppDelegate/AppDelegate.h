//
//  AppDelegate.h
//  socioville
//
//  Created by Valentin Filip on 4/2/12.
//  Copyright (c) 2012 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorSwitcher.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ColorSwitcher* colorSwitcher;

+(AppDelegate *)instance;

- (void)customizeGlobalTheme;

- (void)customizeiPadTheme;
@end
