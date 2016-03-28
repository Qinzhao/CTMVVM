//
//  CThomeTableCell.m
//  CTMVVM
//
//  Created by AllenQin on 16/3/25.
//  Copyright © 2016年 AllenQin. All rights reserved.
//

#import "CThomeTableCell.h"

@interface CThomeTableCell (){
    UIImageView *_headImageView;
    UILabel     *_userName;
    UILabel     *_timeDate;
    UILabel     *_weiboLabel;
}

@end

@implementation CThomeTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _headImageView = [[UIImageView alloc] init];
        _headImageView.layer.cornerRadius = WIDTH_SCALE(15);
        _headImageView.clipsToBounds = YES;
        [self.contentView addSubview:_headImageView];
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(WIDTH_SCALE(30), WIDTH_SCALE(30)));
            make.left.equalTo(self.contentView.mas_left).with.offset((WIDTH_SCALE(10)));
            make.top.equalTo(self.contentView.mas_top).with.offset((WIDTH_SCALE(10)));
        }];
        _userName  = [[UILabel alloc] init];
        _userName.font = [UIFont systemFontOfSize:AutoFont(10)];
        [self.contentView addSubview:_userName];
        [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headImageView.mas_right).with.offset((WIDTH_SCALE(5)));
            make.top.equalTo(self.contentView.mas_top).with.offset((WIDTH_SCALE(10)));
        }];
        _timeDate  = [[UILabel alloc] init];
        _timeDate.font = [UIFont systemFontOfSize:AutoFont(10)];
        [self.contentView addSubview:_timeDate];
        [_timeDate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headImageView.mas_right).with.offset((WIDTH_SCALE(5)));
            make.top.equalTo(_userName.mas_bottom).with.offset((WIDTH_SCALE(5)));
        }];
        _weiboLabel  = [[UILabel alloc] init];
        _weiboLabel.numberOfLines = 0;
        _weiboLabel.font = [UIFont systemFontOfSize:AutoFont(8)];
        [self.contentView addSubview:_weiboLabel];
        [_weiboLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset((WIDTH_SCALE(10)));
            make.right.equalTo(self.contentView.mas_right).with.offset((-WIDTH_SCALE(10)));
            make.top.equalTo(_headImageView.mas_bottom).with.offset((WIDTH_SCALE(5)));
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset((-WIDTH_SCALE(10)));
        }];
        
    }
    
    return self;
}

-(void)setValueWithDic:(PublicModel *) publicModel
{
    _userName.text = publicModel.userName;
    _timeDate.text = publicModel.date;
    _weiboLabel.text = publicModel.text;
    [_headImageView setImageWithURL:publicModel.imageUrl];
}


@end
