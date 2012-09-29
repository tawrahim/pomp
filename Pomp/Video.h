//
//  Video.h
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property (strong) NSString *title;
@property (strong) NSString *description;
@property (strong) NSURL *avatarUrl;
@property (strong) NSURL *videoUrl;

- (id)initWithTitle:(NSString *)aTitle description:(NSString *)aDescription avatarLocation:(NSURL *)anAvatarLocation videoLocation:(NSURL *)aVideoLocation;
@end
