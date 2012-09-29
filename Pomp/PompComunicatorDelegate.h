//
//  PompComunicatorDelegate.h
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import <Foundation/Foundation.h>

@protocol PompComunicatorDelegate <NSObject>

- (void)searchVideosFromYoutubeFailedWithError:(NSError *)error;
- (void)receiveVideosFromYoutubeJSON:(NSData *)objectNotation;

@end
