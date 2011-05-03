//
//  PolygonView.h
//  Poly
//
//  Created by Christian Peterek on 03.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PolygonView : UIView {
    int _sides;
}

-(void) redrawPolygon: (id) poly;

@end
