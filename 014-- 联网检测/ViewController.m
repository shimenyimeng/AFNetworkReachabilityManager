//
//  ViewController.m
//  014-- 联网检测
//
//  Created by mac on 16/10/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    /*
     AFNetworkReachabilityStatusUnknown          = -1,
     AFNetworkReachabilityStatusNotReachable     = 0,
     AFNetworkReachabilityStatusReachableViaWWAN = 1,
     AFNetworkReachabilityStatusReachableViaWiFi = 2,
     */
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        NSLog(@"%zd", status);
        
        if (status == AFNetworkReachabilityStatusNotReachable) {
            
            NSLog(@"没有网络");
        } else if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
            
            NSLog(@"wifi环境");
        } else if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
            
            NSLog(@"移动数据流量");
        } else {
            
            NSLog(@"不可知的网络环境");
        }
        
    }];
    
    [manager startMonitoring];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
