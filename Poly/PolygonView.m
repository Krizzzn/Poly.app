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
    
    
    
    CGContextRotateCTM(context, _rotation);
    
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *t = [[touches anyObject] retain];
    
    _downEvent = [t locationInView:self];
    
    [t release];
    
    [self setNeedsDisplay];
        
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{  
    [super touchesCancelled:touches withEvent:event];    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *t = [[touches anyObject] retain];
    
    if ([t tapCount] > 0)
        _rotation = 0;
    
    [t release];
    
    [super touchesEnded:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *t = [[touches anyObject] retain];
    
    // caching this could improve performance?!?
    CGRect bounds = [self bounds];
    int middle = bounds.size.width / 2;
    
    CGPoint p = [t locationInView:self];
    
    float dist = abs(middle - p.x);
    dist = dist / middle * 120.0; 
    _rotation = (p.y - _downEvent.y) / (int)dist;
    _rotation = ( _rotation) * M_PI;
    
    if (p.x < middle)
        _rotation = _rotation *-1;
    
    [self setNeedsDisplay];
    
    [t release];
    [super touchesMoved:touches withEvent:event];
}


- (void)dealloc
{
    [super dealloc];
}

@end
