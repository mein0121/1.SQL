/*
1. 제품 테이블은 제품_ID 컬럼이 _primary key_ 컬럼으로 그 행을 다른 행과 식별할 때 사용된다.
2. 제품 테이블의 제조사 컬럼은 Not Null(NN) 인 것으로 봐서 __NULL(값이 없는)__ 인 상태일 수가 없다.
3. 고객 테이블에서 다른행과 식별할 때 사용하는 컬럼은 __고객_ID(CUST_ID)__ 이다. 
4. 고객 테이블의 전화번호 컬럼의 데이터 타입은 __VARCHAR2__ 으로 __CHARACTER__형태의 값 _____15_________바이트 저장할 수 있으며 NULL 값을 __가질수 있다__.
5. 고객 테이블의 가입일 컬럼에 대해 4번 처럼 설명해 보시오.
    - 고객 테이블의 가입일 컬럼의 데이터 타입은 __DATE__ 으로 __날짜/시간__형태의 값 __7__바이트 저장할 수 있으며 NULL 값을 __가질수 없다__.
6. 주문 테이블은 총 5개 컬럼이 있다. 정수 타입이 ___3__개이고 문자열 타입이 __1___개 이고 날짜 타입이 ___1______개이다.
7. 고객 테이블과 주문테이블은 서로 관계가 있는 테이블입니다.
    부모테이블은 __고객(CUSTOMERS)__ 이고 자식 테이블은 __주문(ORDERS)__이다.
    부모테이블의 __고객_ID(CUST_ID,PK)__컬럼을 자식테이블의 __고객_ID(CUST_ID,FK)___컬럼이 참조하고 있다.
    고객테이블의 한행의 데이터는 주문테이블의 __0~N__ 행과 관계가 있을 수 있다.
    주문테이블의 한행은 고객테이블의 __1(한)__행과 관계가 있을 수 있다.
8. 주문 테이블과 주문_제품 테이블은 서로 관계가 있는 테이블입니다.
    부모 테이블은 __주문(ORDERS)__ 이고 자식 테이블은 __주문_제품(ORDER_ITEMS)__이다.
    부모 테이블의 __주문ID(ORDER_ID,PK)__컬럼을 자식 테이블의 __주문_ID(ORDER_ID,FK)__컬럼이 참조하고 있다.
    주문 테이블의 한행의 데이터는 주문_제품 테이블의 __0~N__ 행과 관계가 있을 수 있다.
    주문_제품 테이블의 한행은 주문 테이블의 __1(한)__행과 관계가 있을 수 있다.
9. 제품과 주문_제품은 서로 관계가 있는 테이블입니다. 
    부모 테이블은 __제품(PRODUCTS)__ 이고 자식 테이블은 __주문_제품(ORDER_ITEMS)__이다.
    부모 테이블의 __제품_ID(PRODUCT_ID,PK)__컬럼을 자식 테이블의 __제품_ID(PRODUCT_ID,FK)__컬럼이 참조하고 있다.
    제품 테이블의 한행의 데이터는 주문_제품 테이블의 __0~N__ 행과 관계가 있을 수 있다.
    주문_제품 테이블의 한행은 제품 테이블의 __1(한)__행과 관계가 있을 수 있다.
*/

-- TODO: 4개의 테이블에 어떤 값들이 있는지 확인.
SELECT *
FROM CUSTOMERS, PRODUCTS, ORDERS, ORDER_ITEMS;

SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_ITEMS;


-- TODO: 주문 번호가 1인 주문의 주문자 이름, 주소, 우편번호, 전화번호 조회
SELECT C.CUST_ID, 
       C.CUST_NAME, 
       c.ADDRESS,
       c.postal_code,
       c.PHONE_NUMBER
FROM CUSTOMERS C join ORDERS O on C.CUST_ID = O.CUST_ID 
WHERE ORDER_ID = 1;

SELECT C.CUST_ID, 
       C.CUST_NAME, 
       c.ADDRESS,
       c.postal_code,
       c.PHONE_NUMBER
FROM CUSTOMERS C, ORDERS O
WHERE C.CUST_ID = O.CUST_ID AND ORDER_ID = 1;

-- TODO : 주문 번호가 2인 주문의 주문일, 주문상태, 총금액, 주문고객 이름, 주문고객 이메일 주소 조회

SELECT o.order_date, 
       o.order_status, 
       o.order_total, 
       C.CUST_NAME, 
       c.cust_email
FROM CUSTOMERS C JOIN ORDERS O ON C.CUST_ID = O.CUST_ID 
WHERE ORDER_ID = 2;

SELECT o.order_date, 
       o.order_status, 
       o.order_total, 
       C.CUST_NAME, 
       c.cust_email
FROM CUSTOMERS C, ORDERS O
WHERE C.CUST_ID = O.CUST_ID AND ORDER_ID = 2;

-- TODO : 고객 ID가 120인 고객의 이름, 성별, 가입일과 지금까지 주문한 주문정보중 주문_ID, 주문일, 총금액을 조회

SELECT c.cust_name, 
       c.gender, 
       DECODE(c.gender, 'M', '남성', '여성') AS GENDER2,
       case c.gender when 'M' THEN '남성'
                     ELSE '여성'END AS GENDER3,
       c.join_date, 
       o.order_id, 
       o.order_date,
       o.order_total
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE C.CUST_ID = 120;

SELECT c.cust_name, 
       c.gender, 
       c.join_date, 
       o.order_id, 
       o.order_date,
       o.order_total
FROM CUSTOMERS C ,ORDERS O 
WHERE C.CUST_ID = O.CUST_ID(+) AND C.CUST_ID = 120;

-- TODO : 고객 ID가 110인 고객의 이름, 주소, 전화번호, 그가 지금까지 주문한 주문정보중 주문_ID, 주문일, 주문상태 조회
 
SELECT c.cust_name, 
       c.address, 
       c.phone_number, 
       o.order_id, 
       o.order_date, 
       o.order_status
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE C.CUST_ID = 110;

SELECT c.cust_name, 
       c.address, 
       c.phone_number, 
       o.order_id, 
       o.order_date, 
       o.order_status
FROM CUSTOMERS C, ORDERS O 
WHERE C.CUST_ID = O.CUST_ID(+) AND C.CUST_ID = 110;


-- TODO : 고객 ID가 120인 고객의 정보와 지금까지 주문한 주문정보를 모두 조회.

SELECT * -- C.*, O.*
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE C.CUST_ID = 120;

SELECT * -- C.*, O.*
FROM CUSTOMERS C,ORDERS O 
WHERE C.CUST_ID = O.CUST_ID(+) AND C.CUST_ID = 120;

-- TODO : '2017/11/13'(주문날짜) 에 주문된 주문의 주문고객의 고객_ID, 이름, 주문상태, 총금액을 조회

SELECT c.cust_id, c.cust_name, o.order_status, o.order_total, o.order_date
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE O.ORDER_DATE = '2017/11/13';

SELECT c.cust_id, c.cust_name, o.order_status, o.order_total, o.order_date
FROM CUSTOMERS C, ORDERS O
WHERE C.CUST_ID = O.CUST_ID(+) AND O.ORDER_DATE = '2017/11/13';

-- TODO : 주문상세 ID가 xxxx인 주문제품의 제품이름, 판매가격, 제품가격을 조회.

select p.product_name,
       to_char(oi.sell_price, 'fmL999,999'),
       p.price,
       p.price - oi.sell_price
from order_items oi left join products p on oi.product_id = p.product_id
where oi.order_item_id = 1;

SELECT oi.order_item_id, oi.sell_price, p.price
from order_items oi join products p on p.product_id = oi.product_id;




-- TODO : 주문 ID가 4인 주문의 주문 고객의 이름, 주소, 우편번호, 주문일, 주문상태, 총금액, 주문 제품이름, 제조사, 제품가격, 판매가격, 제품수량을 조회.

SELECT c.cust_name, c.address, c.postal_code, 
       o.order_date, o.order_status, o.order_total,
       p.product_name, p.maker, p.price, 
       oi.sell_price, oi.quantity 
FROM CUSTOMERS C left JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
                 left join order_items oi on o.order_id = oi.order_id
                 left join products p on p.product_id = oi.product_id
WHERE o.order_id = 4;

SELECT c.cust_name, c.address, c.postal_code, 
       o.order_date, o.order_status, o.order_total,
       p.product_name, p.maker, p.price, 
       oi.sell_price, oi.quantity 
FROM CUSTOMERS C, ORDERS O, order_items oi, products p
WHERE C.CUST_ID = O.CUST_ID(+) and o.order_id = oi.order_id(+) and p.product_id(+) = oi.product_id and o.order_id = 4;

-- TODO : 제품 ID가 200인 제품이 2017년에 몇개 주문되었는지 조회.

select count(*), sum(quantity)
from products p left join order_items oi on p.product_id = oi.product_id 
                left join orders o on oi.order_id = o.order_id
where oi.product_id = 200 
and   to_char(o.order_date, 'yyyy') = 2017; --extract(year from o.order_date) = 2017;

select count(*), sum(quantity)
from order_items oi left join orders o on oi.order_id = o.order_id
where oi.product_id = 200 and extract(year from o.order_date) = 2017;


-- TODO : 제품분류별 총 주문량을 조회

select p.category, nvl(sum(oi.quantity), 0)
from products p left join order_items oi on p.product_id = oi.product_id
group by p.category
order by 2;
