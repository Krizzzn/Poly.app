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
    _notifications = [[NSMutableDictionary alloc] init];
    
    _sideCount = sides;
    if (self.sideCount < 3)
        _sideCount = 3;
    return self;
}

-(void) notifyListener:(id)object andCallAction: (NSString *) action
{
    [_notifications setObject:object forKey: action];
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
    
   if (_notifications && [_notifications count] > 0)
   {
       for (id object in [_notifications allKeys]) {
           [[_notifications objectForKey:object] performSelector: NSSelectorFromString(object) withObject: (id)self];
       }
   }

}

-(void)dealloc
{
    [_notifications release];
    
    [super dealloc];
}
@end
