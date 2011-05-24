//
//  porsterAppDelegate.h
//  porster
//
//  Created by BlingStorm MacMini Alpha on 11-5-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class porsterViewController;

@interface porsterAppDelegate : NSObject <UIApplicationDelegate> {

}					

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet porsterViewController *viewController;

@end
