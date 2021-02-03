/*
1. 제품 테이블은 제품_ID 컬럼이 _primary key_ 컬럼으로 그 행을 다른 행과 식별할 때 사용된다.
2. 제품 테이블의 제조사 컬럼은 Not Null(NN) 인 것으로 봐서 _빈칸일_________ 인 상태일 수가 없다.
3. 고객 테이블에서 다른행과 식별할 때 사용하는 컬럼은 _고객ID(CUST_ID)_ 이다. 
4. 고객 테이블의 전화번호 컬럼의 데이터 타입은 _VARCHAR2_________ 으로 _CHARACTER_____형태의 값 _____15_________바이트 저장할 수 있으며 NULL 값을 _가질수있다_.
5. 고객 테이블의 가입일 컬럼에 대해 4번 처럼 설명해 보시오.
    - 고객 테이블의 가입일 컬럼의 데이터 타입은 _DATE_ 으로 _날짜_형태의 값 __7___바이트 저장할 수 있으며 NULL 값을 _가질수 없다_.
6. 주문 테이블은 총 5개 컬럼이 있다. 정수 타입이 ___3__개이고 문자열 타입이 __1___개 이고 날짜 타입이 ___1______개이다.
7. 고객 테이블과 주문테이블은 서로 관계가 있는 테이블입니다.
    부모테이블은 __고객테이블__ 이고 자식 테이블은 _주문테이블_이다.
    부모테이블의 __고객ID__컬럼을 자식테이블의 __고객ID___컬럼이 참조하고 있다.
    고객테이블의 한행의 데이터는 주문테이블의 __다중__ 행과 관계가 있을 수 있다.
    주문테이블의 한행은 고객테이블의 ___한행___행과 관계가 있을 수 있다.
8. 주문 테이블과 주문_제품 테이블은 서로 관계가 있는 테이블입니다.
    부모 테이블은 ___주문테이블___ 이고 자식 테이블은 __주문_제품___이다.
    부모 테이블의 ___주문ID____컬럼을 자식 테이블의 __주문ID___컬럼이 참조하고 있다.
    주문 테이블의 한행의 데이터는 주문_제품 테이블의 __다중행__ 행과 관계가 있을 수 있다.
    주문_제품 테이블의 한행은 주문 테이블의 __한행__행과 관계가 있을 수 있다.
9. 제품과 주문_제품은 서로 관계가 있는 테이블입니다. 
    부모 테이블은 __제품___ 이고 자식 테이블은 ___주문_제품___이다.
    부모 테이블의 ___제품_ID___컬럼을 자식 테이블의 ___제품_ID___컬럼이 참조하고 있다.
    제품 테이블의 한행의 데이터는 주문_제품 테이블의 ___여러행___ 행과 관계가 있을 수 있다.
    주문_제품 테이블의 한행은 제품 테이블의 ____단일행___행과 관계가 있을 수 있다.
*/

-- TODO: 4개의 테이블에 어떤 값들이 있는지 확인.
SELECT *
FROM CUSTOMERS, PRODUCTS, ORDERS, ORDER_ITEMS;

-- TODO: 주문 번호가 1인 주문의 주문자 이름, 주소, 우편번호, 전화번호 조회
SELECT C.CUST_ID, C.CUST_NAME, ADDRESS, PHONE_NUMBER
FROM CUSTOMERS C, ORDERS O
WHERE C.CUST_ID = O.CUST_ID AND ORDER_ID = 1;

-- TODO : 주문 번호가 2인 주문의 주문일, 주문상태, 총금액, 주문고객 이름, 주문고객 이메일 주소 조회

SELECT o.order_date, o.order_status, o.order_total, C.CUST_NAME, c.cust_email
FROM CUSTOMERS C, ORDERS O
WHERE C.CUST_ID = O.CUST_ID AND ORDER_ID = 2;

-- TODO : 고객 ID가 120인 고객의 이름, 성별, 가입일과 지금까지 주문한 주문정보중 주문_ID, 주문일, 총금액을 조회

SELECT c.cust_name, c.gender, c.join_date, o.order_id, o.order_date,o.order_total
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE C.CUST_ID = 120;

-- TODO : 고객 ID가 110인 고객의 이름, 주소, 전화번호, 그가 지금까지 주문한 주문정보중 주문_ID, 주문일, 주문상태 조회
 
SELECT c.cust_name, c.address, c.phone_number, o.order_id, o.order_date, o.order_status
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE C.CUST_ID = 110;

-- TODO : 고객 ID가 120인 고객의 정보와 지금까지 주문한 주문정보를 모두 조회.

SELECT C.*, O.*
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE C.CUST_ID = 120;

-- TODO : '2017/11/13'(주문날짜) 에 주문된 주문의 주문고객의 고객_ID, 이름, 주문상태, 총금액을 조회

SELECT c.cust_id, c.cust_name, o.order_status, o.order_total, o.order_date
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE O.ORDER_DATE IN '2017/11/13';


-- TODO : 주문상세 ID가 xxxx인 주문제품의 제품이름, 판매가격, 제품가격을 조회.

SELECT oi.order_item_id, oi.sell_price, p.price
from order_items oi join products p on p.product_id = oi.product_id;

-- TODO : 주문 ID가 4인 주문의 주문 고객의 이름, 주소, 우편번호, 주문일, 주문상태, 총금액, 주문 제품이름, 제조사, 제품가격, 판매가격, 제품수량을 조회.

SELECT c.cust_name, c.address, c.postal_code, 
       o.order_date, o.order_status, o.order_total,
       p.product_name, p.maker, p.price, 
       oi.sell_price, oi.quantity 
FROM CUSTOMERS C JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
                 join order_items oi on o.order_id = oi.order_id
                 join products p on p.product_id = oi.product_id
WHERE o.order_id = 4;

-- TODO : 제품 ID가 200인 제품이 2017년에 몇개 주문되었는지 조회.

select count(*)
from order_items oi join orders o on oi.order_id = o.order_id
where oi.product_id = 200 and extract(year from o.order_date) = 2017;

-- TODO : 제품분류별 총 주문량을 조회

select p.category, sum(oi.quantity)
from products p join order_items oi on p.product_id = oi.product_id
group by p.category;
