//
//  porsterViewController.m
//  porster
//
//  Created by BlingStorm MacMini Alpha on 11-5-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "porsterViewController.h"
#import "IP.h"
#import "ASIHTTPRequest.h"
#import "ASIHTTPRequestConfig.h"

@implementation porsterViewController
@synthesize label4;
@synthesize label3;
@synthesize label2;
@synthesize label1;
@synthesize testButton1;
@synthesize testButton2;
@synthesize testButton3;
@synthesize testButton4;

- (void)dealloc
{   
    [testButton1 release];
    [testButton2 release];
    [testButton3 release];
    [testButton4 release];
    [label1 release];
    [label2 release];
    [label3 release];
    [label4 release];
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
    [super viewDidLoad];
    InitAddresses();
    GetIPAddresses();
    GetHWAddresses();
    
    int i;
    for (i=0; i<MAXADDRS; ++i)
    {
        static unsigned long localHost = 0x7F000001;            // 127.0.0.1
        unsigned long theAddr;
        theAddr = ip_addrs[i];
        if (theAddr == 0) break;
        if (theAddr == localHost) continue;
        NSLog(@"Name: %s MAC: %s IP: %s\n", if_names[i], hw_addrs[i], ip_names[i]);
          //decided what adapter you want details for
        if (strncmp(if_names[i], "en", 2) == 0)
        {
            NSLog(@"Adapter en has a IP of %@", [NSString stringWithFormat:@"%s", ip_names[i]]);
        }
    }
    
    label1.text=[NSString stringWithFormat:@"%s",ip_names[1]];//获取IP
    label2.text=[NSString stringWithFormat:@"%s",hw_addrs[1]];//获取MAC
    
    NSString * UDID = [UIDevice currentDevice].uniqueIdentifier;
    NSLog(@"UDID:%@", label3);
    label3.text = [NSString stringWithFormat:@"%@",UDID];
    
    NSURL *url = [NSURL URLWithString:@"http://www.whatismyip.com/automation/n09230945.asp"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
    NSLog(@"123");
   
  }
    
- (void)requestFinished:(ASIHTTPRequest *)request
    {
        NSString *responseString = [request responseString];
        label4.text=[NSString stringWithFormat:@"%@",responseString];
        NSLog(@"%@",responseString);               
    }
    
    - (void)requestFailed:(ASIHTTPRequest *)request
    {
        label4.text=[NSString stringWithFormat:@"error"];
    }

- (IBAction)copy:(id)sender
{
    UIPasteboard *pasteboard=[UIPasteboard generalPasteboard]; 
    testButton1.tag = 11;
    testButton2.tag = 12;
    testButton3.tag = 13;
    testButton4.tag = 14;
    switch ([sender tag]) {
        case 11:
            pasteboard.string =[NSString stringWithFormat:@"%s",ip_names[1]]; 
            break;
        case 12:
            pasteboard.string =[NSString stringWithFormat:@"%s",hw_addrs[1]];          
            break;
        case 13:
            pasteboard.string =[NSString stringWithFormat:@"%@",label3.text]; 
            break;
        case 14:
            pasteboard.string =[NSString stringWithFormat:@"%@",label4.text]; 
            break;
        default:
            break;
    }
   
}

- (void)viewDidUnload
{
    [self setTestButton1:nil];
    [self setTestButton2:nil];
    [self setTestButton3:nil];
    [self setTestButton4:nil];
    [self setLabel1:nil];
    [self setLabel2:nil];
    [self setLabel3:nil];
    [self setLabel4:nil];
    [super viewDidUnload];
      // Release any retained subviews of the main view.
      // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
      // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
