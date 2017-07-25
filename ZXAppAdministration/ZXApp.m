//
//  ZXApp.m
//  ZXAppAdministration
//
//  Created by zhixiongchen on 2017/7/25.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXApp.h"

@implementation ZXApp
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)appWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
