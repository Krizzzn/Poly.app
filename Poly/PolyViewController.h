//
//  PolyViewController.h
//  Poly
//
//  Created by Christian Peterek on 02.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"

@interface PolyViewController : UIViewController {
    
    IBOutlet UILabel *polySidesLabel;
}

@property (readonly, retain) Polygon *polygon;

- (IBAction)changeSideCount:(id)sender;



@end
