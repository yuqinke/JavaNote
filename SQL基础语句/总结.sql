/*
   数据表的创建
*/
CREATE TABLE sort1(
     id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(100),
     number int
);
/*
   使用数据表

*/
user sort1;
/*
   1.增
 */
 insert into sort1(id,name,number)value
(1,"张三",123456),
(2,"李四",234567);
 /*
   2.删
   删除表数据delete
   删除表drop
 */
 delete from sort1 where id in(1,2,5);
 drop table sort1;
 /*
   3.改
   修改数据
   添加列
   删除列
   改列名
   改表名
 */
 update sort1 set name = "王五" number =3456789 where id=1; 
 alter table sort1 add password int;
 alter table sort1 drop name;
 alter table sort1 change name name1 varchar(50);
 rename table sort1 to sort2;
 
 /*
   4.查
   条件查询
   查询表结构
 */
select*from sort1 where name="张三";
desc sort1;

聚合函数:
	对一列进行计算 返回值是一个,忽略null值
	* sum(),avg(),max(),min(),count();
	1.获得所有商品的价格的总和：
		select sum(price) from products;
	2.获得商品表中价格的平均数：
		select avg(price) from products;
		-- round(值,保留小数位)
		select round(avg(price),2) from products;
	3.获得商品表中有多少条记录：
		select count(*) from products;
		
分组：使用group by
	1.根据cno字段分组，分组后统计商品的个数.
		select cno,count(*) from products group by cno;
	2.根据cno分组，分组统计每组商品的总数量，并且总数量> 200;
		select cno,sum(pnum) from products  group by cno;
		select cno,sum(pnum) from products  group by cno having sum(pnum)>200;
		注意:
		where和having区别:
			1.where 是对分组前的数据进行过滤 ;having 是对分组后的数据进行过滤 
			2.where 后面不能使用聚合函数,having可以
			
-- 添加外键约束
alter table 外键表名 add constraint 约束名称 foreign key (外键字段) references 主键表名(约束列名)
如果表A中的Ids是主键，要约束表B中得Aid列，那么语句应该是：
alter table B add constraint A_B_Ids foreign key(Aid) references A(Ids)

