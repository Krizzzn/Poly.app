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
    Polygon *aPolygon = [[Polygon alloc] initWithSideCountOf:3 notifies:self withAction: @selector(updateSideCountLabel)];
    _polygon = [aPolygon retain];
    [aPolygon release];
    
    [self updateSideCountLabel];
    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [_polygon release];
    [polySidesLabel release];
    polySidesLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) updateSideCountLabel
{
    polySidesLabel.text = [NSString stringWithFormat: @"sides: %d", _polygon.sideCount];
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
