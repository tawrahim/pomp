//
//  UIImageView+Network.m
//  ZTNetworkImageView
//
//  Created by TAMIM Ziad iMAC on 17/06/12.
//  Copyright (c) 2012 TAMIM Ziad. All rights reserved.
//

#import "UIImageView+Network.h"

@implementation UIImageView (Network)

- (void)imageFetcherWithUrl:(NSURL *)url 
{
    @autoreleasepool {
        
        @try {
            NSError *error = nil;
            NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
            
            if (error) {
                NSLog(@"Error : %@",[error localizedDescription]);
            } else {
                
                [self setImage:[UIImage imageWithData:data]];
            }
        }
        @catch (NSException *exception) {
            NSLog(@"Error Thread : %@",[exception reason]);
        }
        @finally {
            
        }
        
    }
}

- (void)loadImageWithUrl:(NSURL *)url 
{
    [self performSelectorInBackground:@selector(imageFetcherWithUrl:) withObject:url];
}

@end
