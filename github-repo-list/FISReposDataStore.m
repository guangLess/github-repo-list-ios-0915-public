//
//  FISReposDataStore.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISReposDataStore.h"
#import "FISGithubRepository.h"

@implementation FISReposDataStore

+ (instancetype)sharedDataStore {
    static FISReposDataStore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[FISReposDataStore alloc] init];
    });
    
    return _sharedDataStore;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _repositories=[NSMutableArray new];
        //[self getGithubRepos];
    }
    return self;
}

-(void)getGithubRepos:(void(^)(BOOL success))completionBlock {
    
    FISGithubAPIClient * client = [[FISGithubAPIClient alloc]init];
    
    [client getReposoitoryWithCompletionBlock:^(NSArray *repoDictionaries) {
        
        for (NSDictionary * eachRepo in repoDictionaries) {
            FISGithubRepository * repo = [[FISGithubRepository alloc] init];
            repo.fullName = eachRepo[@"full_name"];
            repo.repositoryID = eachRepo[@"id"];
            repo.htmlURL = eachRepo[@"html_url"];
            
            [self.repositories addObject: repo];
//            
//            if (self.repositories.count >0 ){
//                completionBlock(YES);
//            } else {
//                NSLog(@"API error %@", [NSError description]);
//            }
        }
        
        if (self.repositories.count != repoDictionaries.count) {
            
            
            completionBlock(NO);
        } else {
            
            completionBlock(YES);

        }
        
        NSLog(@"now i have %lu repo objects stored", self.repositories.count);
    }];
}
    






@end
