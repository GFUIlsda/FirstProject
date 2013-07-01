//
//  main.m
//  ITBook
//
//  Created by SkyLORD on 14.06.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

// <challenge the directive #import, shall connect a type library that describes the use of COM interfaces>
#import <Foundation/Foundation.h>
#import "ITBook.h"
#import "Person.h"

// <the parameter "argc" is the argument count at the time the program is invoked. The parameter "argv" on the other hand is the actual array of arguments. It’s pretty common to pass arguments into a program when invoking it.  Therefore it makes sense that Xcode adds these parameters to the main function by default>
int main(int argc, const char * argv[])
{
// autorelease pool block is marked:
@autoreleasepool
	{
// ONLY for Objective-C class "ITBook"
// introduce five new books with the following characteristics (as announced earlier variables in ITBook.h):
			ITBook *theFirstBook = [[ITBook alloc] initWithTitle:@"Cocoa" author: @"Apple" year:2013 paperback:YES];
			ITBook *theSecondBook = [[[ITBook alloc] init] autorelease];
			ITBook *theThirdBook = [[ITBook alloc] initWithTitle:@"Focoa" author: @"Bapple" year:2011 paperback:YES];
			ITBook *theFourthBook = [[ITBook alloc] initWithTitle:@"Gocoa" author: @"Capple" year:2010 paperback:NO];
			ITBook *theFifthBook = [[ITBook alloc] initWithTitle:@"Hocoa" author: @"Fapple" year:2009 paperback:YES];

// displays a previously entered data on the five books (each on a new line):
			printf("Test ITBook: Short List - ok\n\n");
// and:
			NSLog(@"\n%@\n%@\n%@\n%@\n%@", theFirstBook.stringRepresentation, theSecondBook.stringRepresentation, theThirdBook.stringRepresentation, theFourthBook.stringRepresentation, theFifthBook.stringRepresentation);
		 
// start sorting:
//
			NSArray *theBooksCollection = @[theFirstBook, theSecondBook, theThirdBook, theFourthBook, theFirstBook];
		 
			printf("\nTest ITBook: Info - ok\n\n");
		 
			for (ITBook *theBook in theBooksCollection)
						{
								NSLog(@"%@", theBook.stringRepresentation);
						}
			NSSet *theBooksSet = [NSSet setWithArray:theBooksCollection];
		 
//
			NSArray *theBookSortedByAuthor = [ITBook booksSortByAuthorWithSet:theBooksSet];
		 
			printf("\nTest ITBook: Author - ok\n\n");
		 
			for(ITBook *theBook in theBookSortedByAuthor)
						{
								NSLog(@"%@\n", theBook.author);
						}
		 
			printf("\nTest ITBook: Title - ok\n\n");
		 
//
			NSArray *theBooksSortedByTitle = [ITBook booksSortByTitleWithSet:theBooksSet];
		 
			for(ITBook *theBook in theBooksSortedByTitle)
						{
								NSLog(@"%@\n", theBook.title);
						}
		 
			printf("\nTest ITBook: Year - ok\n\n");
				  
//
			NSArray *theBooksSortedByYear = [ITBook booksSortByYearWithSet:theBooksSet];
				  
			for(ITBook *theBook in theBooksSortedByYear)
						{
								NSLog(@"%ld\n", theBook.year);
						}
//
			NSDictionary *theDictionaryRepresentation = [theBooksCollection.lastObject dictionaryRepresentation];
			ITBook *theSixBook = [[ITBook alloc] initWithDictionaryRepresentation:theDictionaryRepresentation];
				  
			NSLog(@"\n\nITBook: - ok\n----------\n%@\n==========\n%@\n----------\n", theFirstBook.stringRepresentation, theSixBook.stringRepresentation);
				  
	}
	return 0;
}

//	{
		//Person
		// Вводим новые три пользователя со следующими данными (согласно объявлеными ранее переменными в Person.h):
//		Person *theFirstPerson = [[Person alloc] initWithFirstName:@"George" LastName: @"Soros"];
//		Person *theThirdPerson = [[Person alloc] initWithFirstName:@"Warren" LastName: @"Buffett"];
		
//		printf("Test Person: Short List - ok\n\n");
		
//		NSLog(@"\n%@\n%@", theFirstPerson.stringRepresentation, theThirdPerson.stringRepresentation);
		
//	}
	

