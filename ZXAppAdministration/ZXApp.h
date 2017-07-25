//
//  ZXApp.h
//  ZXAppAdministration
//
//  Created by zhixiongchen on 2017/7/25.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXApp : NSObject
//设置这个app有多大
@property(nonatomic,copy)NSString * size;
//设置这个app的下载量
@property (nonatomic ,copy)NSString * download;
//设置app的名称
@property (nonatomic ,copy)NSString * name;
//设置app的头像
@property (nonatomic ,copy)NSString * icon;
//用来判断一个按钮是否被点击过，以防止单元格重用时的错误
@property (nonatomic,assign)BOOL isDownload;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appWithDict:(NSDictionary *)dict;
@end
