//
//  PolyViewController.m
//  Poly
//
//  Created by Christian Peterek on 02.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PolyViewController.h"

@implementation PolyViewController

@synthesize polygon = _polygon;

- (void)dealloc
{
    [polySidesLabel release];
    [polyView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    Polygon *aPolygon = [[Polygon alloc] initWithSideCountOf:3];
    // notifies:self withAction: @selector(updateSideCountLabel)
    
    
    [aPolygon notifyListener:self andCallAction: @"updateSideCountLabel:"];
    [aPolygon notifyListener:polyView andCallAction: @"redrawPolygon:"];
    
    _polygon = [aPolygon retain];
    [aPolygon release];
    
    [self updateSideCountLabel: aPolygon];
    [polyView redrawPolygon:aPolygon];
    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [_polygon release];
    [polySidesLabel release];
    polySidesLabel = nil;
    [polyView release];
    polyView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) updateSideCountLabel: (id) poly
{
    if (![poly isKindOfClass: [Polygon class]])
        return;
    
    Polygon *p = [(Polygon*)poly retain];
    
    polySidesLabel.text = [NSString stringWithFormat: @"sides: %d", p.sideCount];
    
    [p release];
}

- (IBAction)changeSideCount:(id)sender {
    UIButton *btn = [sender retain];
    
    
    if ([btn.titleLabel.text isEqualToString: @"+"])
        [_polygon grow];
    else
        [_polygon shrink];
        
    [btn release];
}
@end
