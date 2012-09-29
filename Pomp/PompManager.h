//
//  PompManager.h
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import <Foundation/Foundation.h>

#import "PompManagerDelegate.h"
#import "PompComunicatorDelegate.h"

@class PompCommunicator;

@interface PompManager : NSObject <PompComunicatorDelegate>
@property (weak) id<PompManagerDelegate> delegate;
@property (strong) PompCommunicator *communicator;

- (void)fetchFeedFromYoutube;
@end
