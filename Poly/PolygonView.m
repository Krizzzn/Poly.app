//
//  PolygonView.m
//  Poly
//
//  Created by Christian Peterek on 03.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PolygonView.h"
#import "Polygon.h"


@implementation PolygonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _sides = 3;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    int sides = _sides;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor colorWithRed:113/255.0 green:203/255.0 blue:255/255.0 alpha:1] set];
    UIRectFill([self bounds]);
    
    CGRect bounds = [self bounds];
    
    
    CGPoint center = CGPointMake(bounds.size.width / 2, bounds.size.height / 2);
    
    float radius = (bounds.size.height < bounds.size.width) ? bounds.size.height / 2 : bounds.size.width / 2;
    radius = radius;
    float anglePerSide = (2.0 / sides) * M_PI ;

    CGContextTranslateCTM(context, center.x, center.y);
    
    [[UIColor whiteColor] setStroke];
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, radius);
    
    do {
        CGContextRotateCTM(context, anglePerSide);
        CGContextAddLineToPoint(context, 0, radius);
        sides--;
    } while (sides > 0);
    
    CGContextClosePath(context);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    
}

- (void) redrawPolygon:(id)poly
{
    if (![poly isKindOfClass: [Polygon class]])
        return;
    
    Polygon *p = [(Polygon*)poly retain];
    
    _sides = p.sideCount;
    [self setNeedsDisplay];
    
    [p release];
}


- (void)dealloc
{
    [super dealloc];
}

@end
