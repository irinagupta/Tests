drop table DATA_TABLE

CREATE TABLE DATA_TABLE (
KEY int,
ID int,
PHONE VARCHAR(20),
MAIL VARCHAR(20))

INSERT INTO DATA_TABLE VALUES
(1, 12345, '89997776655', 'test@mail.ru'),
(2, 54321, '87778885566', 'two@mail.ru'),
(3, 98765, '87776664577', 'three@mail'),
(4, 66678, '87778885566', 'four@mail.ru'),
(5, 34567, '84547895566', 'four@mail.ru'),
(6, 34567, '89087545678', 'five@mail.ru')

with recursive rec as(
  select *
  from DATA_TABLE where phone='87778885566'
  union
  select dt.key, dt.id, dt.phone, dt.mail
  from rec r 
  inner join DATA_TABLE dt
    on (
        (dt.id=r.id) or (dt.phone=r.phone) or (dt.mail=r.mail)
		)
					)
select  * from rec