//
//  HomeViewModel.h
//  CTMVVM
//
//  Created by AllenQin on 16/3/25.
//  Copyright © 2016年 AllenQin. All rights reserved.
//

#import "ViewModelClass.h"
#import "PublicModel.h"
@interface HomeViewModel : ViewModelClass
//获取围脖列表
-(void) fetchPublicWeiBo;

//跳转到微博详情页
-(void) weiboDetailWithPublicModel: (PublicModel *) publicModel WithViewController: (UIViewController *)superController;
@end
