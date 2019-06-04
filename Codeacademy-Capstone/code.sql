SELECT *
FROM survey
LIMIT 10;
select question,
   count(distinct user_id) as 'Responses’
from survey
group by 1;
select * from quiz limit 5; 
select * from home_try_on limit 5;
select * from purchase limit 5;
select q.user_id,
  h.user_id is not null as 'is_home_try_on',
  h.number_of_pairs,
  i.user_id is not null as 'is_purchase'
from quiz q 
left join home_try_on h
on q.user_id = h.user_id
left join purchase i
 on i.user_id = q.user_id;
WITH funnels AS (
  select q.user_id,
  h.user_id is not null as 'is_home_try_on',
  h.number_of_pairs,
  i.user_id is not null as 'is_purchase'
from quiz q 
left join home_try_on h
on q.user_id = h.user_id
left join purchase i
 on i.user_id = q.user_id)
 select COUNT(*) as 'Users',
 sum(is_home_try_on) as 'Tried On',
 sum(is_purchase) as 'Purchased'
 from funnels;
WITH funnels AS (
  select q.user_id,
  h.user_id is not null as 'is_home_try_on',
  h.number_of_pairs,
  i.user_id is not null as 'is_purchase'
from quiz q 
left join home_try_on h
on q.user_id = h.user_id
left join purchase i
 on i.user_id = q.user_id)
 select number_of_pairs as 'Number of Pairs', 
 COUNT(is_purchase) as 'Users'
 from funnels
 group by 1; 
WITH funnels AS (
  select q.user_id,
  h.user_id is not null as 'is_home_try_on',
  h.number_of_pairs,
  i.user_id is not null as 'is_purchase'
from quiz q 
left join home_try_on h
on q.user_id = h.user_id
left join purchase i
 on i.user_id = q.user_id)
 select 
  number_of_pairs as '# of Pairs',
  sum(is_purchase) as '# of Purchases'
  from funnels
  group by 1;