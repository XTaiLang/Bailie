//
//  LMAccountTool.m
//  百家"闻"坛
//
//  Created by lim on 16/2/18.
//  Copyright © 2016年 lim. All rights reserved.
//

#import "LMAccountTool.h"
#import "LMHttpTool.h"
#import "LMAccountParam.h"
#import "MJExtension.h"

#define LMOAuthBaseUrl @"https://api.weibo.com/oauth2/authorize"
#define LMClient_id @"2004282461"
#define LMRedirect_uri @"http://www.baidu.com"
#define LMAppSecret @"8e2823592b7a47ce51278689e2167ac5"

#define LMAccountFileName  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"account.data"]

@implementation LMAccountTool

+ (void)accountWithCode:(NSString *)code success:(void (^)())success failure:(void (^)(NSError *))failure {
    //创建参数模型
    LMAccountParam *params = [[LMAccountParam alloc]init];
    params.client_id = LMClient_id;
    params.client_secret = LMAppSecret;
    params.grant_type = @"authorization_code";
    params.code = code;
    params.redirect_uri = LMRedirect_uri;
    [LMHttpTool POST:@"https://api.weibo.com/oauth2/access_token" parameters:params.mj_keyValues success:^(id responseObject) {
        //请求成功
        //字典转模型
               } failure:^(NSError *error) {
        //请求失败
        if (failure) {
            failure(error);
        }
    }];
    


}

@end
