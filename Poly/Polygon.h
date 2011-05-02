//
//  Polygon.h
//  Poly
//
//  Created by Christian Peterek on 02.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Polygon : NSObject {
    NSObject* _notificationTarget;
    SEL _remoteaction;
}

@property (nonatomic, readonly) int sideCount;

+(id)alloc;

-(id) initWithSideCountOf: (int) sides;
-(id) initWithSideCountOf: (int) sides notifies: (NSObject *) target withAction: (SEL) action;

-(void) grow;
-(void) shrink;
-(void)changeSideCountBy: (int) number;
-(void) dealloc;
@end
