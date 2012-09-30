//
//  VideoBuilder.m
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import "VideoBuilder.h"

#import "Video.h"

@implementation VideoBuilder

- (NSArray *)videosFromJSON:(NSData *)objectNotaion error:(NSError **)error
{
    NSError *localError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:objectNotaion options:0 error:&localError];
    NSDictionary *parsedObject = (id)jsonObject;
    
    if (!parsedObject) {
        // VideoBuilderInvalidJSONError

        return nil;
    }

    NSArray *videos = [[parsedObject valueForKey:@"data"] valueForKey:@"items"];
    if (!videos) {
        // VideoBuilderMissingDataError
    }
    
    NSMutableArray *results = [[NSMutableArray alloc] initWithCapacity:[videos count]];
    for (NSDictionary *parsedVideo in videos) {
        Video *video = [[Video alloc] initWithTitle:[parsedVideo valueForKey:@"title"] description:[parsedVideo valueForKey:@"description"]
                                     avatarLocation:[NSURL URLWithString:[[parsedVideo valueForKey:@"thumbnail"] valueForKey:@"hqDefault"]]
                                      videoLocation:[NSURL URLWithString:[[parsedVideo valueForKey:@"content"] valueForKey:@"5"]]];
        
        [results addObject:video];
    }
    
    return [results copy];
}

@end
