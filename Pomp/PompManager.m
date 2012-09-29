//
//  PompManager.m
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import "PompManager.h"

#import "PompCommunicator.h"

@implementation PompManager

- (void)fetchFeedFromYoutube
{
    [self.communicator searchForVideoFromYoutube];
}

- (void)receiveVideosFromYoutubeJSON:(NSString *)objectNotation
{
    
}

- (void)searchVideosFromYoutubeFailedWithError:(NSError *)error
{
    
}
@end
