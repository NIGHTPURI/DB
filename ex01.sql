/*195p ��������*/
select * from book;
select * from orders;

/*������ȣ�� 1�� ������ �̸�*/
SELECT bookname FROM Book WHERE bookid=1;
/*������ 20000�� �̻��� ������ �̸�*/
SELECT bookname FROM Book WHERE price>=20000;
/*�������� �� ���ž�*/
SELECT sum(saleprice) FROM Orders WHERE custid=1;
/*�������� �� ���ž�2*/
SELECT sum(saleprice) FROM Customer, Orders WHERE Customer.custid=Orders.custid AND Customer.name LIKE '������';
4
SELECT count(*) FROM Orders WHERE custid=1;
5
SELECT count(DISTINCT publisher) FROM Customer, Orders, Book WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='������');
6
SELECT bookname, price, price-saleprice FROM Customer, Orders, Book WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='������');
7
SELECT bookname FROM Book, Orders, Customer
MINUS
SELECT booknmae FROM Book, Orders, Customer
WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='������');
