//
//  FISGithubRepository.m
//  ReviewSession 3-16-14
//
//  Created by Joe Burgess on 3/16/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISGithubRepository.h"

@implementation FISGithubRepository

+(BOOL)isEqual{
    
    return NO;
}

-(instancetype)initWith:(NSString *)fullname reposID:(NSString *)reposID htmlURL:(NSURL *)htmlURL{
    self = [super self];
    if (self) {
        _fullName = fullname;
        _repositoryID = reposID;
        _htmlURL = htmlURL;
    }
    
    return self;
}



@end
