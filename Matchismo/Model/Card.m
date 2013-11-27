//
//  Card.m
//  Matchismo
//
//  Created by Tyson Frederick on 2/26/13.
//  Copyright (c) 2013 san jose state university. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents])  {
            score = 1;
        }
    }
    
    return score;
}

@end
