//
//  ATTest.m
//  ATClangObfuscatorTest
//
//  Created by linzhiman on 2020/9/17.
//  Copyright © 2020 AppToolbox. All rights reserved.
//

#import "ATTest.h"
#import "ATFish.h"
#import "ATBird.h"
#import "ATMonster.h"
#import "ATMonster+Action.h"

@implementation ATTest

AT_IMPLEMENT_SINGLETON(ATTest);

/// sys method should NOT be obfuscated
- (instancetype)init
{
    self = [super init];
    if (self) {
        AT_ADD_NOTIFY_DEFAULT_SELECTOR_NAME(ATMonsterCreate);
    }
    return self;
}

- (void)test
{
    /// should be obfuscated
    ATFish *fish = [ATFish createInstance];
    
    /// should be obfuscated
    [fish swim];
    
    /// should be obfuscated
    [fish swimEx];
    
    /// new should NOT be obfuscated
    id<IATBird> iBird = [ATBird new];
    
    /// should be obfuscated
    [iBird fly];
    
    /// new should NOT be obfuscated
    ATBird *bird = [ATBird new];
    
    /// property should NOT be obfuscated
    int age = [bird age];
    
    /// property should NOT be obfuscated
    [bird setAge:age];
    
    /// property should NOT be obfuscated
    BOOL full = bird.full;
    
    /// property should NOT be obfuscated
    bird.full = full;
    
    /// not property should be obfuscated
    int count = bird.count;
    
    /// not property should be obfuscated
    bird.count = count;
}

/// should be obfuscated
- (void)setMonster:(ATMonster *)monster
{
    /// should be obfuscated
    [monster sleep];
    
    /// should be obfuscated
    [monster doAction];
    
    /// run should NOT be obfuscated
    [monster performSelector:@selector(run)];
    
    /// should be obfuscated
    [ATMonster doClassAction];
    
    id tmp = monster;
    
    /// should be obfuscated
    [tmp sleep];
    
    /// run should NOT be obfuscated
    [tmp run];
    
    /// new should NOT be obfuscated
    id<IATMonster> monsterEx = [ATMonsterEx new];
    
    /// should be obfuscated
    [monsterEx scare];
}

AT_HANDLER_NOTIFY_DEFAULT_SELECTOR_NAME(ATMonsterCreate)
{
    /// should be obfuscated
    [ATMonsterCenterObj create];
    
    ATMonsterCenterObjCreate;
}

@end
