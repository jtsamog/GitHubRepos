//
//  Repo.m
//  GitHubRepos
//
//  Created by Endeavour2 on 7/17/17.
//  Copyright © 2017 SamOg. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)initWithJSONInfo:(NSDictionary *)info {
  
  self = [super init];
  if (self) {
    _name = info[@"name"];
    _repoID = info[@"id"];
    _repoURLString = info[@"html_url"];
    _repoDescription = (![info[@"description"] isKindOfClass:[NSNull class]]) ? info[@"description"] : @"No description";
  }
  return self;
}



@end
