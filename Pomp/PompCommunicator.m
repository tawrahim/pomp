//
//  PompCommunicator.m
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import "PompCommunicator.h"

@implementation PompCommunicator

- (void)searchForVideoFromYoutube
{
    NSURL *url = [NSURL URLWithString:@"https://gdata.youtube.com/feeds/api/videos?q=surfing&v=2&alt=jsonc"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (!error) {
            [self.delegate receiveVideosFromYoutubeJSON:data];
            
        } else {
            [self.delegate searchVideosFromYoutubeFailedWithError:error];
        }
    }];
}



@end
