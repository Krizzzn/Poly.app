//
//  PolyAppDelegate.h
//  Poly
//
//  Created by Christian Peterek on 02.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PolyViewController;

@interface PolyAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PolyViewController *viewController;

@end
