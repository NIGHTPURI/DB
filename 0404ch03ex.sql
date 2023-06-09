/*1_5 박지성이 구매한 도서의 출판사 수*/
SELECT count(distinct publisher)
FROM book
WHERE bookid IN(SELECT bookid
                FROM orders
                WHERE custid = 1);

/*1_6 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이*/
SELECT bookname, price, price-saleprice
FROM Customer, Orders, Book
WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성');

/*1-7 박지성이 구매하지 않은 도서의 이름*/
SELECT bookname 
FROM Book, Orders, Customer 
MINUS 
SELECT bookname 
FROM Book, Orders, Customer
WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성');

/*2-9 주문 금액의 총액과 주문의 평균 금액*/
SELECT sum(saleprice), avg(saleprice) 
FROM Orders;
/*2-10 고객의 이름과 고객별 구매액*/
SELECT name, sum(saleprice) 
FROM Orders, Customer 
WHERE Orders.custid=Customer.custid GROUP BY name;
/*2-11 고객의 이름과 고객이 구매한 도서 목록*/
SELECT name, bookname 
FROM Book, Orders, Customer 
WHERE Orders.bookid=Book.bookid AND Orders.custid=Customer.custid;
/*2-12 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문*/
SELECT * 
FROM Book, Orders 
WHERE Book.bookid=Orders.bookid 
AND price-saleprice=(SELECT max(price-saleprice) 
                    FROM Book, Orders 
                    WHERE Book.bookid=Orders.bookid);
/*2-13 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
SELECT name 
FROM Customer, Orders 
WHERE Customer.custid=Orders.custid GROUP BY name HAVING avg(saleprice) > (SELECT avg(saleprice) FROM Orders);