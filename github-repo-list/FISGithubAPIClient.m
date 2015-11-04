//
//  FISGithubAPIClient.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISGithubAPIClient.h"
#import "FISGithubRepository.h"

@implementation FISGithubAPIClient



-(void)getReposoitoryWithCompletionBlock:(void(^)(NSArray*repoDictionaries))completionBlock {
    
    NSString * urlString = @"https://api.github.com/repositories?client_id=9b303ed1a75fb0052bb9&client_secret=51977e30b4a5a85782428540f80691f772ad44d4";
    NSURL *githubURL = [NSURL URLWithString:urlString];
    NSURLRequest * requestGiturl = [NSURLRequest requestWithURL:githubURL];
    NSURLSession * gitSession = [NSURLSession sharedSession];
    
    NSURLSessionTask * gitTask = [gitSession dataTaskWithRequest:requestGiturl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"hi, im back from space");
        NSArray * gitResults = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"in completionHandler of task; task has returned");
        completionBlock(gitResults);
    }];
    
    NSLog(@"task is set up");
        [gitTask resume];
    NSLog(@"task is started");
}

@end
