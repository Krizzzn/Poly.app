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

-(id) initWithSideCount: (int) sides
{
    _sideCount = sides;
    if (self.sideCount < 3)
        _sideCount = 3;
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
}
@end
