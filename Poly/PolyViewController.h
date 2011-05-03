//
//  PolyViewController.h
//  Poly
//
//  Created by Christian Peterek on 02.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"
#import "PolygonView.h"

@interface PolyViewController : UIViewController {
    
    IBOutlet UILabel *polySidesLabel;
    IBOutlet PolygonView *polyView;
}

@property (readonly, retain) Polygon *polygon;

- (IBAction)changeSideCount:(id)sender;

- (void)updateSideCountLabel: (id) poly;


@end
