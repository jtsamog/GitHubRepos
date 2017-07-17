//
//  Repo.h
//  GitHubRepos
//
//  Created by Endeavour2 on 7/17/17.
//  Copyright © 2017 SamOg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repo : NSObject
@property (strong, nonatomic) NSString *name;
@property (nonatomic, assign) NSUInteger repoID;
@property (nonatomic, copy) NSString *repoURLString;
@property (nonatomic, copy) NSString *repoDescription;

-(instancetype)initWithJSONInfo:(NSDictionary *)info;

@end
