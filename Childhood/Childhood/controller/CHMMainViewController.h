//
//  CHMMainViewController.h
//  Childhood
//
//  Created by duanran on 15/10/8.
//  Copyright © 2015年 duanran. All rights reserved.
//

#import "CHMBaseViewController.h"

@interface CHMMainViewController : CHMBaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)IBOutlet UIButton * naviToMapBtn;
@property(nonatomic,strong)IBOutlet UITableView *tableView;

@end
