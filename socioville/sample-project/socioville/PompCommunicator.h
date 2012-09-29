//
//  PompCommunicator.h
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import <Foundation/Foundation.h>

#import "PompComunicatorDelegate.h"

@interface PompCommunicator : NSObject
@property (weak) id<PompComunicatorDelegate> delegate;

- (void)searchForVideoFromYoutube;
@end
