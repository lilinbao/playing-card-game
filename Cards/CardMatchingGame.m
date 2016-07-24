//
//  CardMatchingGame.m
//  Cards
//
//  Created by hcc on 16/6/11.
//  Copyright © 2016年 linbao. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) int score;
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

-(instancetype) initWithCardCount:(NSUInteger)count unsignedCard:(Deck *)deck
{
    self = [self init];
    if(self){
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BOUND = 4;
static const int COST_TO_CHOOSE = 1;
-(void) chooseCardAtIndex:(NSUInteger)index
{
    
    Card * card = self.cards[index];
    if(!card.isMatched){
        if(card.chosen){
            card.chosen = NO;
        }else{
            //match agest another card
            for(Card * otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        self.score += matchScore * MATCH_BOUND;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                        card.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

-(Card *) cardAtIndex:(NSUInteger)index
{
    if(index < [self.cards count] ){
        return self.cards[index];
    }else {
        return nil;
    }
}

-(NSMutableArray *) cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

@end
