//
//  PolygonView.m
//  Poly
//
//  Created by Christian Peterek on 03.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PolygonView.h"


@implementation PolygonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor colorWithRed:113/255.0 green:203/255.0 blue:255/255.0 alpha:1] set];
    UIRectFill([self bounds]);
    
    CGRect bounds = [self bounds];
    
    int padd = 10;
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, bounds.size.width / 2, padd);
    CGContextAddLineToPoint(context, padd, bounds.size.height - padd);
    CGContextAddLineToPoint(context, bounds.size.width -padd, bounds.size.height - padd);
    CGContextClosePath(context);
    [[UIColor whiteColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    
}


- (void)dealloc
{
    [super dealloc];
}

@end
