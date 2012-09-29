//
//  PompManagerDelegate.h
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import <Foundation/Foundation.h>

@protocol PompManagerDelegate <NSObject>

- (void)fetchVideoFromYoutubeFailedWithError:(NSError *)error;
- (void)didReceiveVideo:(NSArray *)videos;

@end
