//
//  IP.h
//  porster
//
//  Created by BlingStorm MacMini Alpha on 11-5-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//


#define MAXADDRS	32

extern char *if_names[MAXADDRS];
extern char *ip_names[MAXADDRS];
extern char *hw_addrs[MAXADDRS];
extern unsigned long ip_addrs[MAXADDRS];

// Function prototypes

void InitAddresses();
void FreeAddresses();
void GetIPAddresses();
void GetHWAddresses();