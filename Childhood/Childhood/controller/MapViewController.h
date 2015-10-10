//
//  MapViewController.h
//  Childhood
//
//  Created by duanran on 15/10/9.
//  Copyright © 2015年 duanran. All rights reserved.
//

#import "CHMBaseViewController.h"
#import <BaiduMapAPI/BMapKit.h>
@interface MapViewController : CHMBaseViewController<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKPoiSearchDelegate>
@property(nonatomic,strong)IBOutlet BMKMapView *mapview;
@end
