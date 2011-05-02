//
//  Polygon.h
//  Poly
//
//  Created by Christian Peterek on 02.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Polygon : NSObject {

}

@property (nonatomic, readonly) int sideCount;

+(id)alloc;
-(id) initWithSideCount: (int) sides;
-(void) grow;
-(void) shrink;
-(void)changeSideCountBy: (int) number;
@end
