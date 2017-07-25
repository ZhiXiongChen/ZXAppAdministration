//
//  AppCell.m
//  ZXAppAdministration
//
//  Created by zhixiongchen on 2017/7/25.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "AppCell.h"
#import "ZXApp.h"
@interface AppCell()
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *labelIntro;
@property (weak, nonatomic) IBOutlet UIButton *buttonDownload;
- (IBAction)buttonClick;

@end
@implementation AppCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setApp:(ZXApp *)app
{
    _app=app;
    //模型的数据需要给cell中的控件
    self.labelName.text=app.name;
    self.iconImage.image=[UIImage imageNamed:app.icon];
    self.labelIntro.text=[NSString stringWithFormat:@"大小:%@ | 下载:%@",app.size,app.download];
    //更新下按钮的状态，防止单元格重用时的错误
    if(self.app.isDownload)
    {
        self.buttonDownload.enabled=NO;
    }
    else
    {
        self.buttonDownload.enabled=YES;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buttonClick {
    //禁用按钮
    self.buttonDownload.enabled=NO;
    //表示这个按钮已经被点击过了
    self.app.isDownload=YES;
    //通过代理来加上label这个标签
    if([self.delegate respondsToSelector:@selector(appCellButtonDownloadClick:)])
    {
        [self.delegate appCellButtonDownloadClick:self];
    }
}
@end
