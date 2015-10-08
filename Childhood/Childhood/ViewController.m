//
//  ViewController.m
//  Childhood
//
//  Created by duanran on 15/10/8.
//  Copyright © 2015年 duanran. All rights reserved.
//

#import "ViewController.h"
#import "CHMTabBarViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    CHMTabBarViewController *tabbarController=[[CHMTabBarViewController alloc]init];
    [self.navigationController pushViewController:tabbarController animated:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
