/*1-1 ������ȣ�� 1�� ������ �̸�*/
	SELECT bookname FROM Book WHERE bookid=1;
/*1-2 ������ 20,000�� �̻��� ������ �̸�*/
	SELECT bookname FROM Book WHERE price >= 20000;
/*1-3 �������� �� ���ž�*/
	SELECT SUM(saleprice) 
	FROM Customer, Orders 
	WHERE Customer.custid=Orders.custid 
		AND Customer.name LIKE '������';
/*1-4 �������� ������ ������ ��*/
	SELECT COUNT(*) FROM Customer, Orders 
	WHERE Customer.custid=Orders.custid 
         	AND Customer.name LIKE '������';
/*1-5 �������� ������ ������ ���ǻ� ��*/
SELECT COUNT(DISTINCT publisher) 
FROM Customer, Orders, Book 
WHERE Customer.custid=Orders.custid AND Orders.bookid=Book.bookid
	         AND Customer.name LIKE '������';

/*1-6 �������� ������ ������ �̸�,����,������ �ǸŰ����� ����*/
SELECT bookname, price, saleprice, price-saleprice
FROM Customer, Orders, Book 
WHERE Customer.custid=Orders.custid AND Orders.bookid=Book.bookid
         	AND Customer.name LIKE '������';
            
/*1-7 �������� �������� ���� ������ �̸�*/
select bookname
from book b1
where not exists
      (select bookname 
       from customer, orders 
       where customer.custid=orders.custid and orders.bookid=b1.bookid
            and customer.name like '������');
		
	
/*ex1-5*/
select count(distinct publisher)
from customer, orders,book
where customer.custid=orders.custid 
    and orders.bookid=book.bookid 
    and customer.name like '������';
    
/*ex1-6*/
select bookname,price,price-saleprice
from customer, orders,book
where customer.custid=orders.custid 
    and orders.bookid=book.bookid 
    and customer.name like '������';
    
/*ex1-7*/
select bookname
from book
where not exists (
        select bookname
        from customer,orders
        where customer.custid=orders.custid 
                and orders.bookid=book.bookid 
                and customer.name like '������');