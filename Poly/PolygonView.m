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

@synthesize fillPolygon = _fillPolygon;
@synthesize borderSize = _borderSize;

- (void) setFillPolygon:(BOOL)fill
{
    _fillPolygon = fill;
    [self setNeedsDisplay];
}

- (void) setBorderSize:(float)border
{
    _borderSize = border;
    [self setNeedsDisplay];
}

-(id) init
{
    self = [super init];
    self.borderSize = 1;

    _sides = 3;
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _sides = 3;
        self.borderSize = 1;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    int sides = _sides;
    if (_borderSize == 0)
        _borderSize = 1;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor colorWithRed:113/255.0 green:203/255.0 blue:255/255.0 alpha:1] set];
    UIRectFill([self bounds]);
    
    CGRect bounds = [self bounds];
    
    
    CGPoint center = CGPointMake(bounds.size.width / 2, bounds.size.height / 2);
    
    float radius = (bounds.size.height < bounds.size.width) ? bounds.size.height / 2 : bounds.size.width / 2;
    radius = radius - self.borderSize;
    float anglePerSide = (2.0 / sides) * M_PI ;

    CGContextTranslateCTM(context, center.x, center.y);
    
    [[UIColor whiteColor] setStroke];
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, radius);
    CGContextSetLineWidth(context, self.borderSize);
    
    do {
        CGContextRotateCTM(context, anglePerSide);
        CGContextAddLineToPoint(context, 0, radius);
        sides--;
    } while (sides > 0);
    
    CGContextClosePath(context);
    
    [[UIColor orangeColor] setFill];
    
    
    CGPathDrawingMode mode = kCGPathStroke;
    if (self.fillPolygon)
        mode = kCGPathFillStroke;
    CGContextDrawPath(context, mode);
    
    
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
