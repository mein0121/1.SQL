/*
1. ��ǰ ���̺��� ��ǰ_ID �÷��� _primary key_ �÷����� �� ���� �ٸ� ��� �ĺ��� �� ���ȴ�.
2. ��ǰ ���̺��� ������ �÷��� Not Null(NN) �� ������ ���� _��ĭ��_________ �� ������ ���� ����.
3. �� ���̺��� �ٸ���� �ĺ��� �� ����ϴ� �÷��� _��ID(CUST_ID)_ �̴�. 
4. �� ���̺��� ��ȭ��ȣ �÷��� ������ Ÿ���� _VARCHAR2_________ ���� _CHARACTER_____������ �� _____15_________����Ʈ ������ �� ������ NULL ���� _�������ִ�_.
5. �� ���̺��� ������ �÷��� ���� 4�� ó�� ������ ���ÿ�.
    - �� ���̺��� ������ �÷��� ������ Ÿ���� _DATE_ ���� _��¥_������ �� __7___����Ʈ ������ �� ������ NULL ���� _������ ����_.
6. �ֹ� ���̺��� �� 5�� �÷��� �ִ�. ���� Ÿ���� ___3__���̰� ���ڿ� Ÿ���� __1___�� �̰� ��¥ Ÿ���� ___1______���̴�.
7. �� ���̺�� �ֹ����̺��� ���� ���谡 �ִ� ���̺��Դϴ�.
    �θ����̺��� __�����̺�__ �̰� �ڽ� ���̺��� _�ֹ����̺�_�̴�.
    �θ����̺��� __��ID__�÷��� �ڽ����̺��� __��ID___�÷��� �����ϰ� �ִ�.
    �����̺��� ������ �����ʹ� �ֹ����̺��� __����__ ��� ���谡 ���� �� �ִ�.
    �ֹ����̺��� ������ �����̺��� ___����___��� ���谡 ���� �� �ִ�.
8. �ֹ� ���̺�� �ֹ�_��ǰ ���̺��� ���� ���谡 �ִ� ���̺��Դϴ�.
    �θ� ���̺��� ___�ֹ����̺�___ �̰� �ڽ� ���̺��� __�ֹ�_��ǰ___�̴�.
    �θ� ���̺��� ___�ֹ�ID____�÷��� �ڽ� ���̺��� __�ֹ�ID___�÷��� �����ϰ� �ִ�.
    �ֹ� ���̺��� ������ �����ʹ� �ֹ�_��ǰ ���̺��� __������__ ��� ���谡 ���� �� �ִ�.
    �ֹ�_��ǰ ���̺��� ������ �ֹ� ���̺��� __����__��� ���谡 ���� �� �ִ�.
9. ��ǰ�� �ֹ�_��ǰ�� ���� ���谡 �ִ� ���̺��Դϴ�. 
    �θ� ���̺��� __��ǰ___ �̰� �ڽ� ���̺��� ___�ֹ�_��ǰ___�̴�.
    �θ� ���̺��� ___��ǰ_ID___�÷��� �ڽ� ���̺��� ___��ǰ_ID___�÷��� �����ϰ� �ִ�.
    ��ǰ ���̺��� ������ �����ʹ� �ֹ�_��ǰ ���̺��� ___������___ ��� ���谡 ���� �� �ִ�.
    �ֹ�_��ǰ ���̺��� ������ ��ǰ ���̺��� ____������___��� ���谡 ���� �� �ִ�.
*/

-- TODO: 4���� ���̺� � ������ �ִ��� Ȯ��.
SELECT *
FROM CUSTOMERS, PRODUCTS, ORDERS, ORDER_ITEMS;

-- TODO: �ֹ� ��ȣ�� 1�� �ֹ��� �ֹ��� �̸�, �ּ�, �����ȣ, ��ȭ��ȣ ��ȸ
SELECT C.CUST_ID, C.CUST_NAME, ADDRESS, PHONE_NUMBER
FROM CUSTOMERS C, ORDERS O
WHERE C.CUST_ID = O.CUST_ID AND ORDER_ID = 1;

-- TODO : �ֹ� ��ȣ�� 2�� �ֹ��� �ֹ���, �ֹ�����, �ѱݾ�, �ֹ��� �̸�, �ֹ��� �̸��� �ּ� ��ȸ

SELECT o.order_date, o.order_status, o.order_total, C.CUST_NAME, c.cust_email
FROM CUSTOMERS C, ORDERS O
WHERE C.CUST_ID = O.CUST_ID AND ORDER_ID = 2;

-- TODO : �� ID�� 120�� ���� �̸�, ����, �����ϰ� ���ݱ��� �ֹ��� �ֹ������� �ֹ�_ID, �ֹ���, �ѱݾ��� ��ȸ

SELECT c.cust_name, c.gender, c.join_date, o.order_id, o.order_date,o.order_total
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE C.CUST_ID = 120;

-- TODO : �� ID�� 110�� ���� �̸�, �ּ�, ��ȭ��ȣ, �װ� ���ݱ��� �ֹ��� �ֹ������� �ֹ�_ID, �ֹ���, �ֹ����� ��ȸ
 
SELECT c.cust_name, c.address, c.phone_number, o.order_id, o.order_date, o.order_status
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE C.CUST_ID = 110;

-- TODO : �� ID�� 120�� ���� ������ ���ݱ��� �ֹ��� �ֹ������� ��� ��ȸ.

SELECT C.*, O.*
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE C.CUST_ID = 120;

-- TODO : '2017/11/13'(�ֹ���¥) �� �ֹ��� �ֹ��� �ֹ����� ��_ID, �̸�, �ֹ�����, �ѱݾ��� ��ȸ

SELECT c.cust_id, c.cust_name, o.order_status, o.order_total, o.order_date
FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE O.ORDER_DATE IN '2017/11/13';


-- TODO : �ֹ��� ID�� xxxx�� �ֹ���ǰ�� ��ǰ�̸�, �ǸŰ���, ��ǰ������ ��ȸ.

SELECT oi.order_item_id, oi.sell_price, p.price
from order_items oi join products p on p.product_id = oi.product_id;

-- TODO : �ֹ� ID�� 4�� �ֹ��� �ֹ� ���� �̸�, �ּ�, �����ȣ, �ֹ���, �ֹ�����, �ѱݾ�, �ֹ� ��ǰ�̸�, ������, ��ǰ����, �ǸŰ���, ��ǰ������ ��ȸ.

SELECT c.cust_name, c.address, c.postal_code, 
       o.order_date, o.order_status, o.order_total,
       p.product_name, p.maker, p.price, 
       oi.sell_price, oi.quantity 
FROM CUSTOMERS C JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
                 join order_items oi on o.order_id = oi.order_id
                 join products p on p.product_id = oi.product_id
WHERE o.order_id = 4;

-- TODO : ��ǰ ID�� 200�� ��ǰ�� 2017�⿡ � �ֹ��Ǿ����� ��ȸ.

select count(*)
from order_items oi join orders o on oi.order_id = o.order_id
where oi.product_id = 200 and extract(year from o.order_date) = 2017;

-- TODO : ��ǰ�з��� �� �ֹ����� ��ȸ

select p.category, sum(oi.quantity)
from products p join order_items oi on p.product_id = oi.product_id
group by p.category;
