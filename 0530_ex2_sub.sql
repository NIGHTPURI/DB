/*��ø����-where��-�񱳿�����*/
SELECT orderid, custid, saleprice
FROM orders md
WHERE saleprice > (SELECT AVG(saleprice)
                    FROM orders so
                    WHERE md.custid=so.custid);
                    
/*��ø���� -in,not in ������*/
SELECT sum(saleprice) "total"
FROM orders
WHERE custid IN(SELECT custid
                FROM customer
                WHERE address LIKE '%���ѹα�%');
                
SELECT orderid, saleprice
FROM orders
WHERE saleprice > ALL(SELECT saleprice
                        FROM orders
                        WHERE custid=3);
                        
/*��ø ���� -exists, not existsSET������*/
SELECT sum(saleprice)"total"
FROM orders od
WHERE exists(select *
                from customer cs
                where address like '%���ѹα�%' and cs.custid=od.custid);