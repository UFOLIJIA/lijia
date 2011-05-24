//
//  porsterViewController.h
//  porster
//
//  Created by BlingStorm MacMini Alpha on 11-5-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface porsterViewController : UIViewController {
    UIButton *testButton1;
    UIButton *testButton2;
    UIButton *testButton3;
    UIButton *testButton4;
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
}

@property (nonatomic, retain) IBOutlet UILabel *label4;
@property (nonatomic, retain) IBOutlet UILabel *label3;
@property (nonatomic, retain) IBOutlet UILabel *label2;
@property (nonatomic, retain) IBOutlet UILabel *label1;
@property (nonatomic, retain) IBOutlet UIButton *testButton1;
@property (nonatomic, retain) IBOutlet UIButton *testButton2;
@property (nonatomic, retain) IBOutlet UIButton *testButton3;
@property (nonatomic, retain) IBOutlet UIButton *testButton4;

-(IBAction)copy:(id)sender;

@end
