//
//  Video.m
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import "Video.h"

@implementation Video

- (id)initWithTitle:(NSString *)aTitle description:(NSString *)aDescription avatarLocation:(NSURL *)anAvatarLocation videoLocation:(NSURL *)aVideoLocation
{
    if ((self = [super init])) {
        self.title = aTitle;
        self.description = aDescription;
        self.avatarUrl = anAvatarLocation;
        self.videoUrl = aVideoLocation;
    }
    
    return self;
}

@end
