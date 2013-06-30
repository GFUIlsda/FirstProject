//
//  main.m
//  ITBook
//
//  Created by SkyLORD on 14.06.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITBook.h"
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
       //ITBook 
		 // Вводим новые пять книг со следующими характеристиками (согласно объявлеными ранее переменными в ITBook.h):
        ITBook *theFirstBook = [[ITBook alloc] initWithTitle:@"Cocoa" author: @"Apple" year:2013 paperback:YES];
        ITBook *theSecondBook = [[[ITBook alloc] init] autorelease];
        ITBook *theThirdBook = [[ITBook alloc] initWithTitle:@"Focoa" author: @"Bapple" year:2011 paperback:YES];
        ITBook *theFourthBook = [[ITBook alloc] initWithTitle:@"Gocoa" author: @"Capple" year:2010 paperback:NO];
        ITBook *theFifthBook = [[ITBook alloc] initWithTitle:@"Hocoa" author: @"Fapple" year:2009 paperback:YES];

		 // Выводим на монитор ранее введенные данные по пяти книгам (каждый с новой строки):
       printf("Test ITBook: Short List - ok\n\n");
		 
		 NSLog(@"\n%@\n%@\n%@\n%@\n%@", theFirstBook.stringRepresentation, theSecondBook.stringRepresentation, theThirdBook.stringRepresentation, theFourthBook.stringRepresentation, theFifthBook.stringRepresentation);
		 
		 // Начинаем сортировку:
		 NSArray *theBooksCollection = @[theFirstBook, theSecondBook, theThirdBook, theFourthBook, theFirstBook];
		 
		 printf("\nTest ITBook: Info - ok\n\n");
		 
		 for (ITBook *theBook in theBooksCollection)
		 {
			 NSLog(@"%@", theBook.stringRepresentation);
		 }
		 NSSet *theBooksSet = [NSSet setWithArray:theBooksCollection];
		 
		 NSArray *theBookSortedByAuthor = [ITBook booksSortByAuthorWithSet:theBooksSet];
		 
		 printf("\nTest ITBook: Author - ok\n\n");
		 
		 for(ITBook *theBook in theBookSortedByAuthor)
		 {
			 NSLog(@"%@\n", theBook.author);
		 }
		 
		 printf("\nTest ITBook: Title - ok\n\n");
		 
		 NSArray *theBooksSortedByTitle = [ITBook booksSortByTitleWithSet:theBooksSet];
		 
		 for(ITBook *theBook in theBooksSortedByTitle)
		 {
			 NSLog(@"%@\n", theBook.title);
		 }
		 
		 printf("\nTest ITBook: Year - ok\n\n");
				  
				  NSArray *theBooksSortedByYear = [ITBook booksSortByYearWithSet:theBooksSet];
				  
				  for(ITBook *theBook in theBooksSortedByYear)
				  {
					  NSLog(@"%ld\n", theBook.year);
				  }
		 
		 
				  NSDictionary *theDictionaryRepresentation = [theBooksCollection.lastObject dictionaryRepresentation];
				  ITBook *theSixBook = [[ITBook alloc] initWithDictionaryRepresentation:theDictionaryRepresentation];
				  
				  NSLog(@"\n\nITBook: - ok\n----------\n%@\n==========\n%@\n----------\n", theFirstBook.stringRepresentation, theSixBook.stringRepresentation);
				  
    }
	
	{
		//Person
		// Вводим новые три пользователя со следующими данными (согласно объявлеными ранее переменными в Person.h):
//		ITBook *theFirstPerson = [[Person alloc] initWithFirstName:@"George" LastName: @"Soros"];
//		ITBook *theThirdPerson = [[Person alloc] initWithFirstName:@"Warren" LastName: @"Buffett"];
		
		printf("Test Person: Short List - ok\n\n");
		
//		NSLog(@"\n%@\n%@", theFirstPerson.stringRepresentation, theThirdPerson.stringRepresentation);
		
	}
	
    return 0;
}
