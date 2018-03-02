/* ALL QUERIES PERFORMED IN MYSQL */

/*List the number of copies from George Orwell for each branch A_2 */
select Branch.branchName, count(BookCopy.ISBN) as "Number of Copies of George Orwell's Books"
from bookcopy
inner join branch on bookcopy.branchName = branch.branchname
where bookcopy.ISBN = (select ISBN from BookInvolvement where authorID = "794195" and ISBN = bookcopy.ISBN)
group by branchName;


/*Count books title Lost Tribe are available by the branch St Thomas Library B_2 */
select a.branchName as Branch, b.title as Title, count(*) as Copies from bookcopy a, book b
where a.branchName = "St Thomas Library"
and a.ISBN = "978-0-31218-695-1"
and b.ISBN ="978-0-31218-695-1"
and a.available = "Y";


/*--C_2*/
/* Query will also return people who never borrowed a book */
select member.firstName as "First Name", member.lastName as "Last Name" from member
left join loan on member.memberID = loan.memberID
where loan.loanDate < "2017-01-01"
and member.memberID not in
(select memberID from loan where loan.loanDate > "2017-01-01")
or loan.loanDate is null;



/*D_2*/
/* Query was run on the 23/11/2017 and will not give the same result as in the video if run now*/
select book.title as "Book Title", member.firstname as "First Name", member.lastname as "Last Name", member.emailAddress as "Email Address"
from member
left join loan on member.memberID = loan.memberID
left join bookcopy on loan.copyID = bookcopy.ID
left join book on bookcopy.ISBN = book.ISBN
where loan.dueDate = curdate();




/*E_2*/
select book.title as "Ian Cooper overdue Books", loan.loanDate as "Date Borrowed", loan.dueDate as "Date Due"
from loan
left join bookcopy on loan.copyID = bookcopy.id
left join book on bookcopy.isbn = book.isbn
where loan.memberID = "0000000001"
and loan.dueDate < now()
and loan.returned = "N";

select sum(fineAmount) as "Ian Cooper Fine Amount" from fine
where memberID = "0000000001";
