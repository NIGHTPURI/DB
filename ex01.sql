/*195p 연습문제*/
select * from book;
select * from orders;

/*도서번호가 1인 도서의 이름*/
SELECT bookname FROM Book WHERE bookid=1;
/*가격이 20000원 이상인 도서의 이름*/
SELECT bookname FROM Book WHERE price>=20000;
/*박지성의 총 구매액*/
SELECT sum(saleprice) FROM Orders WHERE custid=1;
/*박지성의 총 구매액2*/
SELECT sum(saleprice) FROM Customer, Orders WHERE Customer.custid=Orders.custid AND Customer.name LIKE '박지성';
4
SELECT count(*) FROM Orders WHERE custid=1;
5
SELECT count(DISTINCT publisher) FROM Customer, Orders, Book WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성');
6
SELECT bookname, price, price-saleprice FROM Customer, Orders, Book WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성');
7
SELECT bookname FROM Book, Orders, Customer
MINUS
SELECT booknmae FROM Book, Orders, Customer
WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성');
