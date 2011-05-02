//
//  Polygon.m
//  Poly
//
//  Created by Christian Peterek on 02.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Polygon.h"

@implementation Polygon


@synthesize sideCount = _sideCount;

+(id)alloc
{
    return [super alloc];
}

-(id) initWithSideCountOf: (int) sides
{
    return [self initWithSideCountOf:sides notifies:nil withAction:nil];
}

-(id) initWithSideCountOf: (int) sides notifies: (NSObject *) target withAction: (SEL) action
{
    _sideCount = sides;
    if (self.sideCount < 3)
        _sideCount = 3;
    
    if (target && action){
        _notificationTarget = [target retain];
        _remoteaction = action;
    }
    
    return self;
}

-(void) grow
{
    [self changeSideCountBy:1];
}

-(void) shrink
{
    [self changeSideCountBy:-1];
}

-(void)changeSideCountBy: (int) number
{
    if (_sideCount + number < 3)
        return;
    _sideCount += number; 
    
    if (_notificationTarget)
        [_notificationTarget performSelector:_remoteaction];
}

-(void)dealloc
{
    [_notificationTarget release];
    
    [super dealloc];
}
@end
