/* ALL QUERIES PERFORMED IN MYSQL */

/*A */
update bookcopy set available = "Y"
  where id = 16;

update loan set returned = "Y"
  where copyID = 16
  and loanDate = "2017-08-02 10:45:58"
  and dueDate = "2017-10-02";

/* Reverse update A
update bookcopy set available = "N"
  where id = 16;

update loan set returned = "N"
  where copyID = 16
  and loanDate = "2017-08-02 10:45:58"
  and dueDate = "2017-10-02";

*/

/*B */
insert into loan values(
    null,
    now(),
    "2017-12-31",
    18,
    "0000000001",
    (select branchName from BookCopy where id = 18),
    "N"
  );

update bookcopy set available = "N" where id = 18;

/* B reverse update
delete from loan
  where copyID = 18;

update bookcopy set available = "Y" where id = 18;
*/

/* C */
insert into Book values(
  "978-0-00823-809-4",
  "A Knight of the Seven Kingdoms",
  2017,
  368
);

insert into Author values(
  "519713",
  "George",
  "Martin",
  "1948-09-20",
  "USA"
);

insert into BookInvolvement values(
  "978-0-00823-809-4",
  "519713"
);

insert into BookCopy values(
  21,
  "978-0-00823-809-4",
  "St Thomas Library",
  "Y"
);

insert into BookCopy values(
  22,
  "978-0-00823-809-4",
  "Exeter Library",
  "Y"
);

/* Revert C
delete from Book where ISBN = "978-0-00823-809-4";
delete from author where authorID = "519713";
delete from BookInvolvement where authorID = "519713" and ISBN = "978-0-00823-809-4";
delete from bookcopy where id = 21;
delete from bookcopy where id = 22;
*/


/* D */
delete from bookcopy where id = 20;

/* D revert update
insert into BookCopy values(
  20,
  "978-0-31218-695-1",
  "St Thomas Library",
  "Y"
); */

/* E */
update fine set fineAmount = 0.0 where memberID = "0000000001";

/* E revert
update fine set fineAmount = 12.50 where fineID = "012345";
update fine set fineAmount = 20.00 where fineID = "123456";
update fine set fineAmount = 200.00 where fineID = "123457";
*/
