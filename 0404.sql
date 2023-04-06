/*���� �ܺ� ����*/
select name, saleprice 
from Customer left outer JOIN Orders on Customer.custid=Orders.custid;

/*���� �ܺ� ����(+)*/
SELECT customer.name, saleprice
from Customer, orders 
WHERE Customer.custid=Orders.custid;

/*���� ��� ������ ���� ǥ��*/
SELECT max(price)
FROM Book;

/*���� ��� ������ �̸�*/
SELECT bookname
FROM Book
WHERE price=35000;

/*���� ��� ������ �̸�(��������)*/
SELECT bookname 
FROM book 
WHERE price=(select MAX(price) from book);

/*������ ������ �� �ִ� �� ���̵� ã��*/
SELECT custid 
FROM Orders;

/*�� ���̵� �ش��ϴ� �� ��ǰ ã��*/
SELECT name
FROM customer
WHERE custid IN (1,2,3,4);

/*������ ������ �� �ִ� �� ���̵� ã��(��������)*/
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);

/*���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�*/
select b1.bookname 
from Book b1 
where b1.price > (select avg(b2.price) from Book b2 where b2.publisher=b1.publisher);