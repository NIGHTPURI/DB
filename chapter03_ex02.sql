/*���缭�� ������ �Ѽ�*/
SELECT count(*)
FROM Book;
/*���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�*/
SELECT count(distinct publisher)
FROM Book;
/*��� ���� �̸�, �ּ�*/
SELECT name,address
FROM Customer;
/*2020�� 7��4��~7��7�� ���̿� �ֹ����� ������ �ֹ���ȣ*/
SELECT orderid 
FROM Orders
WHERE orderdate BETWEEN '2020-07-04' and '2020-07-07';
/*2020�� 7��4��~7��9�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ*/
SELECT orderid
FROM Orders
WHERE not orderdate BETWEEN '2020-07-04' and '2020-07-09';
/*���� '��'���� ���� �̸��� �ּ�*/
select name, address from customer where name like '��%';
/*���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�*/
select name, address from customer where name like '��%��';