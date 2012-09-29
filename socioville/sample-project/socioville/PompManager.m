//
//  PompManager.m
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import "PompManager.h"

#import "PompCommunicator.h"
#import "VideoBuilder.h"

@implementation PompManager

- (void)fetchFeedFromYoutube
{
    [self.communicator searchForVideoFromYoutube];
}

- (void)receiveVideosFromYoutubeJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *videos = [self.videoBuilder videosFromJSON:objectNotation error:&error];
    
    if (!videos) {
        [self.delegate fetchVideoFromYoutubeFailedWithError:error];
        
    } else {
        [self.delegate didReceiveVideo:videos];
    }
}

- (void)searchVideosFromYoutubeFailedWithError:(NSError *)error
{
    
}
@end
