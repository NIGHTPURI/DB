/*왼쪽 외부 조인*/
select name, saleprice 
from Customer left outer JOIN Orders on Customer.custid=Orders.custid;

/*왼쪽 외부 조인(+)*/
SELECT customer.name, saleprice
from Customer, orders 
WHERE Customer.custid=Orders.custid;

/*가장 비싼 도서의 가격 표시*/
SELECT max(price)
FROM Book;

/*가장 비싼 도서의 이름*/
SELECT bookname
FROM Book
WHERE price=35000;

/*가장 비싼 도서의 이름(하위질의)*/
SELECT bookname 
FROM book 
WHERE price=(select MAX(price) from book);

/*도서를 구매한 적 있는 고객 아이디 찾기*/
SELECT custid 
FROM Orders;

/*고객 아이디에 해당하는 고객 상품 찾기*/
SELECT name
FROM customer
WHERE custid IN (1,2,3,4);

/*도서를 구매한 적 있는 고객 아이디 찾기(하위질의)*/
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);

/*출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오*/
select b1.bookname 
from Book b1 
where b1.price > (select avg(b2.price) from Book b2 where b2.publisher=b1.publisher);