//
//  PlayingCard.m
//  Cards
//
//  Created by hcc on 16/6/10.
//  Copyright © 2016年 linbao. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;//because we provide setter and getter

-(int) match:(NSArray *)otherCards
{
    int score = 0;
    if([otherCards count] == 1){
        PlayingCard *card = otherCards[0];
        if([self.suit isEqualToString:[card suit]]){
            score = 2;
        }else if(self.rank == card.rank){
            score = 4;
        }
    }
    return score;
}

-(NSString *) suit
{
    return _suit?_suit:@"?";
}
+(NSArray *) validSuits
{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}
-(void) setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
+(NSArray *)rankStrings {

    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

-(NSString *) contents
{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

+ (NSUInteger)maxRank
{
    return [[PlayingCard rankStrings] count] -1;
}

-(void) setRank:(NSUInteger)rank
{
    if(rank <= [[PlayingCard rankStrings] count]){
        _rank = rank;
    }
}

@end