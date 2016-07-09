//
//  LMUserTool.m
//  百家"闻"坛
//
//  Created by lim on 16/2/18.
//  Copyright © 2016年 lim. All rights reserved.
//

#import "LMUserTool.h"
#import "LMHttpTool.h"
#import "LMUserParam.h"
#import "LMAccountTool.h"

#import "MJExtension.h"

@implementation LMUserTool

+(void)unreadWithSuccess:(void (^)(LMUserResult *))success failure:(void (^)(NSError *))failure {
    //创建参数模型
    LMUserParam *params = [LMUserParam param];
    
    //get请求
    [LMHttpTool GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:params.mj_keyValues success:^(id responseObject) {
        if (success) {
            //字典转模型
            LMUserResult *result = [LMUserResult mj_objectWithKeyValues:responseObject];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


@end
