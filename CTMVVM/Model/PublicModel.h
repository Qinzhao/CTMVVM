//
//  AppDelegate.h
//  CTMVVM
//
//  Created by AllenQin on 16/3/25.
//  Copyright © 2016年 AllenQin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicModel : NSObject
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *weiboId;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSURL *imageUrl;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *text;

@end
