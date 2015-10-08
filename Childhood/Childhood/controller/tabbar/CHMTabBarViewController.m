//
//  CHMViewController.m
//  Childhood
//
//  Created by duanran on 15/10/8.
//  Copyright © 2015年 duanran. All rights reserved.
//

#import "CHMTabBarViewController.h"
#import "CHMMainViewController.h"
#import "CHMSecondViewController.h"
#import "CHMThirdViewcontroller.h"
#import <objc/runtime.h>

@interface CHMTabBarViewController ()

@end

@implementation CHMTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setControllers];

    // Do any additional setup after loading the view.
}
-(void)setControllers
{
    CHMMainViewController *discovery=[[CHMMainViewController alloc]init];
    UINavigationController *discoveryNav=[[UINavigationController alloc]initWithRootViewController:discovery];
    CHMSecondViewController *order=[[CHMSecondViewController alloc]initWithNibName:@"CHMSecondViewController" bundle:nil];
    UINavigationController *orderNav=[[UINavigationController alloc]initWithRootViewController:order];
    CHMThirdViewController *mine=[[CHMThirdViewController alloc]initWithNibName:@"CHMThirdViewController" bundle:nil];
    UINavigationController *mineNav=[[UINavigationController alloc]initWithRootViewController:mine];
    NSArray *navArr=@[discoveryNav,orderNav,mineNav];
    [self setViewControllers:navArr];
    
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"findClick", @"orderList", @"mine"];
    NSArray *tabBarTitle = @[@"发现",@"订单",@"我的"];
    
    
    [self.tabBar setFrame:CGRectMake(CGRectGetMinX(self.tabBar.frame), CGRectGetMinY(self.tabBar.frame), CGRectGetWidth(self.tabBar.frame), 63)];
    NSInteger index = 0;
    for (RDVTabBarItem *item in self.tabBar.items) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item setTitle:[tabBarTitle objectAtIndex:index]];
        
        index++;
    }
    self.navigationController.navigationBar.hidden=YES;
}
- (NSInteger)indexForViewController:(UIViewController *)viewController{
    UIViewController *searchedController = viewController;
    // 保存的可能是 UINavigationController
    if (searchedController.navigationController) {
        searchedController = searchedController.navigationController;
    }
    return [self.viewControllers indexOfObject:searchedController];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setTabBarHidden:(BOOL)hidden {
    [self setTabBarHidden:hidden animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
#pragma mark - UIViewController+CHMTabBarControllerItem
@implementation UIViewController (CHMTabBarControllerItem)

- (void)CHMSetTabBarController:(CHMTabBarViewController *)CHMTabBarController {
    objc_setAssociatedObject(self, @selector(CHMTabBarViewController), CHMTabBarController, OBJC_ASSOCIATION_ASSIGN);
}

- (RDVTabBarController *)CHMTabBarViewController{
    RDVTabBarController *tabBarController = objc_getAssociatedObject(self, @selector(CHMTabBarViewController));
    if (!tabBarController && self.parentViewController) {
        tabBarController = self.parentViewController.rdv_tabBarController;
    }
    return tabBarController;
}

- (CHMTabBarItem *)CHMTabBarItem{
    CHMTabBarViewController *tabBarController = self.CHMTabBarViewController;
    NSInteger index = [tabBarController indexForViewController:self];
    
    return [tabBarController.tabBar.items objectAtIndex:index];
}

- (void)CHMSetTabBarItem:(CHMTabBarItem *)CHMTabBarItem{
    CHMTabBarViewController *tabBarController = [self CHMTabBarViewController];
    if (!tabBarController) {
        return;
    }
    
    CHMTabBar *tabBar = (CHMTabBar *)tabBarController.tabBar;
    NSInteger index = [tabBarController indexForViewController:self];
    
    NSMutableArray *tabBarItems = [[NSMutableArray alloc] initWithArray:tabBar.items];
    [tabBarItems replaceObjectAtIndex:index withObject:tabBarItems];
    [tabBar setItems:tabBarItems];
}
@end
