//
//  CHMViewController.h
//  Childhood
//
//  Created by duanran on 15/10/8.
//  Copyright © 2015年 duanran. All rights reserved.
//

#import "RDVTabBarController.h"
#import "CHMTabBarItem.h"
#import "CHMTabBar.h"

@interface CHMTabBarViewController : RDVTabBarController

@end

@interface UIViewController (UPMTabBarControllerItem)
@property (nonatomic, strong, setter = UPMSetTabBarItem:) CHMTabBarItem *UPMTabBarItem;
@property (nonatomic, readonly) CHMTabBarViewController *CHMTabBarViewController;

- (void)UPMSetTabBarController:(CHMTabBarViewController *)UPMTabBarController;

@end