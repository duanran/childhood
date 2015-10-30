//
//  CHMMainViewController.m
//  Childhood
//
//  Created by duanran on 15/10/8.
//  Copyright © 2015年 duanran. All rights reserved.
//

#import "CHMMainViewController.h"
#import "MapViewController.h"
#import "CHMainTableViewCell.h"
@interface CHMMainViewController ()
{
    int num;
}
@end

@implementation CHMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    num=3;
    
    // Do any additional setup after loading the view from its nib.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer=@"CHMainTableViewCell";
    CHMainTableViewCell *cell=nil;
    cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    NSArray *cellArr=[[NSBundle mainBundle]loadNibNamed:@"CHMainTableViewCell" owner:self options:nil];
    if (cell==nil) {
        cell=[cellArr objectAtIndex:0];
    }
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return num;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)naviToMapViewController:(id)sender
{
    MapViewController *map=[[MapViewController alloc]init];
    [self.navigationController pushViewController:map animated:YES];
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
