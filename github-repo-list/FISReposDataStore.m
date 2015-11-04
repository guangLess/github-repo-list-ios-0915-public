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

-(void)getGithubRepos:(void(^)(NSArray*repoDataStoredArray))completionBlock {
    
    FISGithubAPIClient * client = [[FISGithubAPIClient alloc]init];
    
    
    [client getReposoitoryWithCompletionBlock:^(NSArray *repoDictionaries) {
        
        for (NSDictionary * eachRepo in repoDictionaries) {
            FISGithubRepository * repo = [[FISGithubRepository alloc] init];
            repo.fullName = eachRepo[@"full_name"];
            repo.repositoryID = eachRepo[@"id"];
            repo.htmlURL = eachRepo[@"html_url"];
            //repo.reposDictionary = eachRepo;
            
            //if ([eachRepo isKindOfClass: [FISGithubRepository class]]) {
                [self.repositories addObject: repo];
           // }
        }
        completionBlock(self.repositories);

        NSLog(@"now i have %lu repo objects stored", self.repositories.count);
    }];
}
    






@end
