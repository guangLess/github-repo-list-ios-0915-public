//
//  FISReposDataStore.h
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "FISGithubAPIClient.h"



@interface FISReposDataStore : NSObject


+ (instancetype)sharedDataStore;

@property (strong, nonatomic) NSMutableArray *repositories;

-(void)getGithubRepos:(void(^)(BOOL success))completionBlock;

@end
