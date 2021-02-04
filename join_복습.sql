/*
1. ��ǰ ���̺��� ��ǰ_ID �÷��� _primary key_ �÷����� �� ���� �ٸ� ��� �ĺ��� �� ���ȴ�.
2. ��ǰ ���̺��� ������ �÷��� Not Null(NN) �� ������ ���� __NULL(���� ����)__ �� ������ ���� ����.
3. �� ���̺��� �ٸ���� �ĺ��� �� ����ϴ� �÷��� __��_ID(CUST_ID)__ �̴�. 
4. �� ���̺��� ��ȭ��ȣ �÷��� ������ Ÿ���� __VARCHAR2__ ���� __CHARACTER__������ �� _____15_________����Ʈ ������ �� ������ NULL ���� __������ �ִ�__.
5. �� ���̺��� ������ �÷��� ���� 4�� ó�� ������ ���ÿ�.
    - �� ���̺��� ������ �÷��� ������ Ÿ���� __DATE__ ���� __��¥/�ð�__������ �� __7__����Ʈ ������ �� ������ NULL ���� __������ ����__.
6. �ֹ� ���̺��� �� 5�� �÷��� �ִ�. ���� Ÿ���� ___3__���̰� ���ڿ� Ÿ���� __1___�� �̰� ��¥ Ÿ���� ___1______���̴�.
7. �� ���̺�� �ֹ����̺��� ���� ���谡 �ִ� ���̺��Դϴ�.
    �θ����̺��� __��(CUSTOMERS)__ �̰� �ڽ� ���̺��� __�ֹ�(ORDERS)__�̴�.
    �θ����̺��� __��_ID(CUST_ID,PK)__�÷��� �ڽ����̺��� __��_ID(CUST_ID,FK)___�÷��� �����ϰ� �ִ�.
    �����̺��� ������ �����ʹ� �ֹ����̺��� __0~N__ ��� ���谡 ���� �� �ִ�.
    �ֹ����̺��� ������ �����̺��� __1(��)__��� ���谡 ���� �� �ִ�.
8. �ֹ� ���̺�� �ֹ�_��ǰ ���̺��� ���� ���谡 �ִ� ���̺��Դϴ�.
    �θ� ���̺��� __�ֹ�(ORDERS)__ �̰� �ڽ� ���̺��� __�ֹ�_��ǰ(ORDER_ITEMS)__�̴�.
    �θ� ���̺��� __�ֹ�ID(ORDER_ID,PK)__�÷��� �ڽ� ���̺��� __�ֹ�_ID(ORDER_ID,FK)__�÷��� �����ϰ� �ִ�.
    �ֹ� ���̺��� ������ �����ʹ� �ֹ�_��ǰ ���̺��� __0~N__ ��� ���谡 ���� �� �ִ�.
    �ֹ�_��ǰ ���̺��� ������ �ֹ� ���̺��� __1(��)__��� ���谡 ���� �� �ִ�.
9. ��ǰ�� �ֹ�_��ǰ�� ���� ���谡 �ִ� ���̺��Դϴ�. 
    �θ� ���̺��� __��ǰ(PRODUCTS)__ �̰� �ڽ� ���̺��� __�ֹ�_��ǰ(ORDER_ITEMS)__�̴�.
    �θ� ���̺��� __��ǰ_ID(PRODUCT_ID,PK)__�÷��� �ڽ� ���̺��� __��ǰ_ID(PRODUCT_ID,FK)__�÷��� �����ϰ� �ִ�.
    ��ǰ ���̺��� ������ �����ʹ� �ֹ�_��ǰ ���̺��� __0~N__ ��� ���谡 ���� �� �ִ�.
    �ֹ�_��ǰ ���̺��� ������ ��ǰ ���̺��� __1(��)__��� ���谡 ���� �� �ִ�.
*/

-- TODO: 4���� ���̺� � ������ �ִ��� Ȯ��.
SELECT *
FROM CUSTOMERS, PRODUCTS, ORDERS, ORDER_ITEMS;

SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_ITEMS;


-- TODO: �ֹ� ��ȣ�� 1�� �ֹ��� �ֹ��� �̸�, �ּ�, �����ȣ, ��ȭ��ȣ ��ȸ
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

-- TODO : �ֹ� ��ȣ�� 2�� �ֹ��� �ֹ���, �ֹ�����, �ѱݾ�, �ֹ��� �̸�, �ֹ��� �̸��� �ּ� ��ȸ

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

-- TODO : �� ID�� 120�� ���� �̸�, ����, �����ϰ� ���ݱ��� �ֹ��� �ֹ������� �ֹ�_ID, �ֹ���, �ѱݾ��� ��ȸ

SELECT c.cust_name, 
       c.gender, 
       DECODE(c.gender, 'M', '����', '����') AS GENDER2,
       case c.gender when 'M' THEN '����'
                     ELSE '����'END AS GENDER3,
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

-- TODO : �� ID�� 110�� ���� �̸�, �ּ�, ��ȭ��ȣ, �װ� ���ݱ��� �ֹ��� �ֹ������� �ֹ�_ID, �ֹ���, �ֹ����� ��ȸ
 
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


-- TODO : �� ID�� 120�� ���� ������ ���ݱ��� �ֹ��� �ֹ������� ��� ��ȸ.

SELECT * -- C.*, O.*
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE C.CUST_ID = 120;

SELECT * -- C.*, O.*
FROM CUSTOMERS C,ORDERS O 
WHERE C.CUST_ID = O.CUST_ID(+) AND C.CUST_ID = 120;

-- TODO : '2017/11/13'(�ֹ���¥) �� �ֹ��� �ֹ��� �ֹ����� ��_ID, �̸�, �ֹ�����, �ѱݾ��� ��ȸ

SELECT c.cust_id, c.cust_name, o.order_status, o.order_total, o.order_date
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE O.ORDER_DATE = '2017/11/13';

SELECT c.cust_id, c.cust_name, o.order_status, o.order_total, o.order_date
FROM CUSTOMERS C, ORDERS O
WHERE C.CUST_ID = O.CUST_ID(+) AND O.ORDER_DATE = '2017/11/13';

-- TODO : �ֹ��� ID�� xxxx�� �ֹ���ǰ�� ��ǰ�̸�, �ǸŰ���, ��ǰ������ ��ȸ.

select p.product_name,
       to_char(oi.sell_price, 'fmL999,999'),
       p.price,
       p.price - oi.sell_price
from order_items oi left join products p on oi.product_id = p.product_id
where oi.order_item_id = 1;

SELECT oi.order_item_id, oi.sell_price, p.price
from order_items oi join products p on p.product_id = oi.product_id;




-- TODO : �ֹ� ID�� 4�� �ֹ��� �ֹ� ���� �̸�, �ּ�, �����ȣ, �ֹ���, �ֹ�����, �ѱݾ�, �ֹ� ��ǰ�̸�, ������, ��ǰ����, �ǸŰ���, ��ǰ������ ��ȸ.

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

-- TODO : ��ǰ ID�� 200�� ��ǰ�� 2017�⿡ � �ֹ��Ǿ����� ��ȸ.

select count(*), sum(quantity)
from products p left join order_items oi on p.product_id = oi.product_id 
                left join orders o on oi.order_id = o.order_id
where oi.product_id = 200 
and   to_char(o.order_date, 'yyyy') = 2017; --extract(year from o.order_date) = 2017;

select count(*), sum(quantity)
from order_items oi left join orders o on oi.order_id = o.order_id
where oi.product_id = 200 and extract(year from o.order_date) = 2017;


-- TODO : ��ǰ�з��� �� �ֹ����� ��ȸ

select p.category, nvl(sum(oi.quantity), 0)
from products p left join order_items oi on p.product_id = oi.product_id
group by p.category
order by 2;
