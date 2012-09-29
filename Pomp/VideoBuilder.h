//
//  VideoBuilder.h
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import <Foundation/Foundation.h>

@interface VideoBuilder : NSObject
- (NSArray *)videosFromJSON:(NSData *)objectNotaion error:(NSError **)error;
@end
