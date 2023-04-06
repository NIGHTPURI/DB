/*1_5 �������� ������ ������ ���ǻ� ��*/
SELECT count(distinct publisher)
FROM book
WHERE bookid IN(SELECT bookid
                FROM orders
                WHERE custid = 1);

/*1_6 �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����*/
SELECT bookname, price, price-saleprice
FROM Customer, Orders, Book
WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='������');

/*1-7 �������� �������� ���� ������ �̸�*/
SELECT bookname 
FROM Book, Orders, Customer 
MINUS 
SELECT bookname 
FROM Book, Orders, Customer
WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='������');

/*2-9 �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
SELECT sum(saleprice), avg(saleprice) 
FROM Orders;
/*2-10 ���� �̸��� ���� ���ž�*/
SELECT name, sum(saleprice) 
FROM Orders, Customer 
WHERE Orders.custid=Customer.custid GROUP BY name;
/*2-11 ���� �̸��� ���� ������ ���� ���*/
SELECT name, bookname 
FROM Book, Orders, Customer 
WHERE Orders.bookid=Book.bookid AND Orders.custid=Customer.custid;
/*2-12 ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�*/
SELECT * 
FROM Book, Orders 
WHERE Book.bookid=Orders.bookid 
AND price-saleprice=(SELECT max(price-saleprice) 
                    FROM Book, Orders 
                    WHERE Book.bookid=Orders.bookid);
/*2-13 ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
SELECT name 
FROM Customer, Orders 
WHERE Customer.custid=Orders.custid GROUP BY name HAVING avg(saleprice) > (SELECT avg(saleprice) FROM Orders);