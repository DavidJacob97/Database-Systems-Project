/*
 * This view returns the details of who has taken more than one loan
 * It also gives a count of how many loans they have taken
 */		
CREATE VIEW members_who_have_had_more_than_one_loan AS

	SELECT members.surname, members.name, COUNT(loans.loan_id) AS NumberOfLoans
	FROM 
		(loans INNER JOIN members ON loans.member_id = memberS.member_id)
	
    GROUP BY name
    HAVING numberOfLoans>1;
	
	
/*
 * This view returns the member information of any member
 * that currently has an overdue loan.
 */	
CREATE VIEW overdue_loans AS	
	SELECT name, surname, email
	FROM members
	WHERE member_id IN (SELECT member_id
						FROM loans 
						WHERE NOW() > date_due);
	

/* 
 * The next three views return the titles from each category
 * that are currently out on loan.
 */		
CREATE VIEW journals_currently_on_loan AS
	SELECT title, author, publisher, year_pub
	FROM journals NATURAL JOIN loans
	WHERE date_due > NOW() AND isbn IN
									 (SELECT isbn 
									  FROM items
									  WHERE cat = '	Journal	');	

CREATE VIEW fiction_currently_on_loan AS
	SELECT title, author, publisher, year_pub
	FROM fiction NATURAL JOIN loans
	WHERE date_due > NOW() AND isbn IN
									 (SELECT isbn 
									  FROM items
									  WHERE cat = '	Fiction	');
				   
CREATE VIEW non_fiction_currently_on_loan	AS			   
	SELECT title, author, publisher, year_pub
	FROM non_fiction NATURAL JOIN loans
	WHERE date_due > NOW() AND isbn IN
									 (SELECT isbn 
									  FROM items
									  WHERE cat = '	Non-Fiction	');
