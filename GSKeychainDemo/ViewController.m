//
//  ViewController.m
//  GSKeychainDemo
//
//  Created by dongway on 14-8-24.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "ViewController.h"
#import <GSKeychain.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (![[[GSKeychain systemKeychain] secretForKey:@"GSKeychainDemoInstalled"] isEqualToString:@"firstInstall"]) {
        [[GSKeychain systemKeychain] setSecret:@"firstInstall" forKey:@"GSKeychainDemoInstalled"];
        NSLog(@"第一次安装该app");
    }else{
        NSLog(@"不是第一次安装该app");
    }
    
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"GSKeychainDemoFirstRun"] isEqualToString:@"firstRun"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"firstRun" forKey:@"GSKeychainDemoFirstRun"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"第一次运行app");
    }else{
        NSLog(@"不是第一次运行app");
    }
    NSLog(@"keychain在app卸载后仍然不会删除数据；而userDefaults在app卸载后会删除掉数据");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
