/*
   ���ݱ�Ĵ���
*/
CREATE TABLE sort1(
     id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(100),
     number int
);
/*
   ʹ�����ݱ�

*/
user sort1;
/*
   1.��
 */
 insert into sort1(id,name,number)value
(1,"����",123456),
(2,"����",234567);
 /*
   2.ɾ
   ɾ��������delete
   ɾ����drop
 */
 delete from sort1 where id in(1,2,5);
 drop table sort1;
 /*
   3.��
   �޸�����
   �����
   ɾ����
   ������
   �ı���
 */
 update sort1 set name = "����" number =3456789 where id=1; 
 alter table sort1 add password int;
 alter table sort1 drop name;
 alter table sort1 change name name1 varchar(50);
 rename table sort1 to sort2;
 
 /*
   4.��
   ������ѯ
   ��ѯ��ṹ
 */
select*from sort1 where name="����";
desc sort1;

�ۺϺ���:
	��һ�н��м��� ����ֵ��һ��,����nullֵ
	* sum(),avg(),max(),min(),count();
	1.���������Ʒ�ļ۸���ܺͣ�
		select sum(price) from products;
	2.�����Ʒ���м۸��ƽ������
		select avg(price) from products;
		-- round(ֵ,����С��λ)
		select round(avg(price),2) from products;
	3.�����Ʒ�����ж�������¼��
		select count(*) from products;
		
���飺ʹ��group by
	1.����cno�ֶη��飬�����ͳ����Ʒ�ĸ���.
		select cno,count(*) from products group by cno;
	2.����cno���飬����ͳ��ÿ����Ʒ��������������������> 200;
		select cno,sum(pnum) from products  group by cno;
		select cno,sum(pnum) from products  group by cno having sum(pnum)>200;
		ע��:
		where��having����:
			1.where �ǶԷ���ǰ�����ݽ��й��� ;having �ǶԷ��������ݽ��й��� 
			2.where ���治��ʹ�þۺϺ���,having����
			
-- ������Լ��
alter table ������� add constraint Լ������ foreign key (����ֶ�) references ��������(Լ������)
�����A�е�Ids��������ҪԼ����B�е�Aid�У���ô���Ӧ���ǣ�
alter table B add constraint A_B_Ids foreign key(Aid) references A(Ids)

