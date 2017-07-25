//
//  AppCell.h
//  ZXAppAdministration
//
//  Created by zhixiongchen on 2017/7/25.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppCell;
@protocol AppCellDelegate <NSObject>
-(void)appCellButtonDownloadClick:(AppCell *)cell;
@end
@class ZXApp;
@interface AppCell : UITableViewCell
@property (nonatomic,strong)ZXApp *app;
@property (nonatomic,weak) id<AppCellDelegate>delegate;
@end
