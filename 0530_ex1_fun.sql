/*2023-05-23 함수 연습*/
/*고객별 평균 주문 금액을 백원 단위로 반올림하기*/
SELECT custid "고객번호", round(SUM(saleprice)/COUNT(*), -2) "평균금액"
FROM orders
GROUP BY custid;

/*날짜의 이전 이후 계산*/
SELECT TO_DATE('2020-07-01', 'yyyy-mm-dd')+5 before,
TO_DATE('2020-07-01', 'yyyy-mm-dd')-5 after
FROM dual;

/*주문일로부터 10일 후 매출 확정*/
SELECT orderid "주문번호", orderdate "주문일", orderdate+10 "확정"
FROM orders;

/*dbms 서버에 설정된 현재 날짜와 시간, 요일 확인*/
SELECT sysdate,
to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
FROM dual;

/*마당서점 고객 중 같은 성을 가진 사람이 몇 명인지 성별 인원수 구하기*/
SELECT substr(name,1,1)"성",COUNT(*)"인원"
FROM customer
GROUP BY substr(name,1,1);

/*null값을 다른 값으로 대치하는 nvl함수*/
SELECT name "이름",nvl(phone,'연락처 없음')"전화번호"
FROM customer;

/*sql조회결과를 순번으로 나타내는 rownum*/
SELECT ROWNUM "순번", custid,name,phone
FROM customer
WHERE ROWNUM<=2;