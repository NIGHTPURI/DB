/*2023-05-23 �Լ� ����*/
/*���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��ϱ�*/
SELECT custid "����ȣ", round(SUM(saleprice)/COUNT(*), -2) "��ձݾ�"
FROM orders
GROUP BY custid;

/*��¥�� ���� ���� ���*/
SELECT TO_DATE('2020-07-01', 'yyyy-mm-dd')+5 before,
TO_DATE('2020-07-01', 'yyyy-mm-dd')-5 after
FROM dual;

/*�ֹ��Ϸκ��� 10�� �� ���� Ȯ��*/
SELECT orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate+10 "Ȯ��"
FROM orders;

/*dbms ������ ������ ���� ��¥�� �ð�, ���� Ȯ��*/
SELECT sysdate,
to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
FROM dual;

/*���缭�� �� �� ���� ���� ���� ����� �� ������ ���� �ο��� ���ϱ�*/
SELECT substr(name,1,1)"��",COUNT(*)"�ο�"
FROM customer
GROUP BY substr(name,1,1);

/*null���� �ٸ� ������ ��ġ�ϴ� nvl�Լ�*/
SELECT name "�̸�",nvl(phone,'����ó ����')"��ȭ��ȣ"
FROM customer;

/*sql��ȸ����� �������� ��Ÿ���� rownum*/
SELECT ROWNUM "����", custid,name,phone
FROM customer
WHERE ROWNUM<=2;