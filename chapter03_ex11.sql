/*(1) ~ (4)*/
/*극장 테이블 생성*/
create table theater(
    movienum NUMBER,
    theaname varchar2(20),
    location varchar2(20),
    PRIMARY KEY(movienum)
);

/*상영관 테이블 생성*/
/*영화 가격은 20,000원을 넘지 않아야 한다*/
/*상영관 번호는 1부터 10 사이이다*/
create table mtheater(
    movienum NUMBER,
    mtheanum NUMBER CHECK(1 <= mtheanum AND mtheanum <= 10),
    moviename varchar2(20),
    price NUMBER CHECK(price < 20000),
    seatcount NUMBER,
    PRIMARY KEY(movienum, mtheanum)
);

/*고객 테이블 생성*/
create table theacust(
    custnum NUMBER,
    custname varchar2(20),
    address varchar2(20),
    PRIMARY KEY(custnum)
);

/*예약 테이블 생성*/
/*상영관 번호는 1부터 10 사이이다*/
/*같음 사람이 같은 좌석번호를 두 번 예약하지 않아야 한다.*/
create table reserv(
    movienum NUMBER,
    theanum NUMBER CHECK(1 <= theanum AND theanum <= 10),
    custnum NUMBER,
    seatnum NUMBER UNIQUE,
    reserdate DATE,
    PRIMARY KEY(movienum, theanum, custnum)
);

/*값 넣기*/
/*극장 테이블*/
insert into theater
values (1, '롯데', '잠실');
insert into theater
values (2, '메가', '강남');
insert into theater
values (3, '대한', '잠실');

/*상영관 테이블*/
insert into mtheater
values (1, 1, '어려운 영화', 15000, 48);
insert into mtheater
values (3, 1, '멋진 영화', 7500, 120);
insert into mtheater
values (3, 2, '재밌는 영화', 8000, 110);

/*예약 테이블*/
insert into reserv
values (3, 2, 3, 15, '2020-09-01');
insert into reserv
values (3, 1, 4, 16, '2020-09-01');
insert into reserv
values (1, 1, 9, 48, '2020-09-01');

/*고객 테이블*/
insert into theacust
values (3, '홍길동', '강남');
insert into theacust
values (4, '김철수', '잠실');
insert into theacust
values (5, '박영희', '강남');