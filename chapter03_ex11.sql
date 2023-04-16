/*(1) ~ (4)*/
/*���� ���̺� ����*/
create table theater(
    movienum NUMBER,
    theaname varchar2(20),
    location varchar2(20),
    PRIMARY KEY(movienum)
);

/*�󿵰� ���̺� ����*/
/*��ȭ ������ 20,000���� ���� �ʾƾ� �Ѵ�*/
/*�󿵰� ��ȣ�� 1���� 10 �����̴�*/
create table mtheater(
    movienum NUMBER,
    mtheanum NUMBER CHECK(1 <= mtheanum AND mtheanum <= 10),
    moviename varchar2(20),
    price NUMBER CHECK(price < 20000),
    seatcount NUMBER,
    PRIMARY KEY(movienum, mtheanum)
);

/*�� ���̺� ����*/
create table theacust(
    custnum NUMBER,
    custname varchar2(20),
    address varchar2(20),
    PRIMARY KEY(custnum)
);

/*���� ���̺� ����*/
/*�󿵰� ��ȣ�� 1���� 10 �����̴�*/
/*���� ����� ���� �¼���ȣ�� �� �� �������� �ʾƾ� �Ѵ�.*/
create table reserv(
    movienum NUMBER,
    theanum NUMBER CHECK(1 <= theanum AND theanum <= 10),
    custnum NUMBER,
    seatnum NUMBER UNIQUE,
    reserdate DATE,
    PRIMARY KEY(movienum, theanum, custnum)
);

/*�� �ֱ�*/
/*���� ���̺�*/
insert into theater
values (1, '�Ե�', '���');
insert into theater
values (2, '�ް�', '����');
insert into theater
values (3, '����', '���');

/*�󿵰� ���̺�*/
insert into mtheater
values (1, 1, '����� ��ȭ', 15000, 48);
insert into mtheater
values (3, 1, '���� ��ȭ', 7500, 120);
insert into mtheater
values (3, 2, '��մ� ��ȭ', 8000, 110);

/*���� ���̺�*/
insert into reserv
values (3, 2, 3, 15, '2020-09-01');
insert into reserv
values (3, 1, 4, 16, '2020-09-01');
insert into reserv
values (1, 1, 9, 48, '2020-09-01');

/*�� ���̺�*/
insert into theacust
values (3, 'ȫ�浿', '����');
insert into theacust
values (4, '��ö��', '���');
insert into theacust
values (5, '�ڿ���', '����');