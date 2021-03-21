SELECT user_id
/* Calculate KPIs for Number of Orders per Cuisine Type */ 
,SUM(CASE WHEN cuisine_parent = 'Breakfast'										THEN 1 ELSE 0 END ) AS Num_of_Orders_Breakfast	
,SUM(CASE WHEN cuisine_parent = 'Italian'										THEN 1 ELSE 0 END ) AS Num_of_Orders_Italian
,SUM(CASE WHEN cuisine_parent = 'Meat'                  						THEN 1 ELSE 0 END ) AS Num_of_Orders_Meat
,SUM(CASE WHEN cuisine_parent = 'Street food'           						THEN 1 ELSE 0 END ) AS Num_of_Orders_Street_food
,SUM(CASE WHEN cuisine_parent = 'Traditional'           						THEN 1 ELSE 0 END ) AS Num_of_Orders_Traditional
,SUM(CASE WHEN cuisine_parent = 'Creperie'              						THEN 1 ELSE 0 END ) AS Num_of_Orders_Creperie
,SUM(CASE WHEN cuisine_parent = 'Ethnic'                						THEN 1 ELSE 0 END ) AS Num_of_Orders_Ethnic
,SUM(CASE WHEN cuisine_parent = 'Sweets'                						THEN 1 ELSE 0 END ) AS Num_of_Orders_Sweets
,SUM(CASE WHEN cuisine_parent = 'Healthy / Other'       						THEN 1 ELSE 0 END ) AS Num_of_Orders_Healthy_Other
,SUM(CASE WHEN cuisine_parent in ('Ethnic' ,'Sweets', 'Healthy / Other')       	THEN 1 ELSE 0 END ) AS Num_of_Orders_All_Other

/* Calculate KPIs for value of Orders per Cuisine Type */ 
,SUM(CASE WHEN cuisine_parent = 'Breakfast'										THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Breakfast	
,SUM(CASE WHEN cuisine_parent = 'Italian'										THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Italian
,SUM(CASE WHEN cuisine_parent = 'Meat'                  						THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Meat
,SUM(CASE WHEN cuisine_parent = 'Street food'           						THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Street_food
,SUM(CASE WHEN cuisine_parent = 'Traditional'           						THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Traditional
,SUM(CASE WHEN cuisine_parent = 'Creperie'              						THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Creperie
,SUM(CASE WHEN cuisine_parent = 'Ethnic'                						THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Ethnic
,SUM(CASE WHEN cuisine_parent = 'Sweets'                						THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Sweets
,SUM(CASE WHEN cuisine_parent = 'Healthy / Other'       						THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Healthy_Other
,SUM(CASE WHEN cuisine_parent in ('Ethnic' ,'Sweets', 'Healthy / Other')       	THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_All_Other

/* Calculate KPIs for average value of Orders per Cuisine Type */ 
,AVG(CASE WHEN cuisine_parent = 'Breakfast'										THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Breakfast	
,AVG(CASE WHEN cuisine_parent = 'Italian'										THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Italian
,AVG(CASE WHEN cuisine_parent = 'Meat'                  						THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Meat
,AVG(CASE WHEN cuisine_parent = 'Street food'           						THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Street_food
,AVG(CASE WHEN cuisine_parent = 'Traditional'           						THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Traditional
,AVG(CASE WHEN cuisine_parent = 'Creperie'              						THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Creperie
,AVG(CASE WHEN cuisine_parent = 'Ethnic'                						THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Ethnic
,AVG(CASE WHEN cuisine_parent = 'Sweets'                						THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Sweets
,AVG(CASE WHEN cuisine_parent = 'Healthy / Other'       						THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Healthy_Other
,AVG(CASE WHEN cuisine_parent in ('Ethnic' ,'Sweets', 'Healthy / Other')       	THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_All_Other

/* Calculate KPIs for Unique Stores  per Cuisine Type */ 
,COUNT(DISTINCT CASE WHEN cuisine_parent = 'Breakfast'			   							THEN shop_id END ) AS Number_of_Unq_Shops_Breakfast	
,COUNT(DISTINCT CASE WHEN cuisine_parent = 'Italian'			   							THEN shop_id END ) AS Number_of_Unq_Shops_Italian
,COUNT(DISTINCT CASE WHEN cuisine_parent = 'Meat'                  							THEN shop_id END ) AS Number_of_Unq_Shops_Meat
,COUNT(DISTINCT CASE WHEN cuisine_parent = 'Street food'           							THEN shop_id END ) AS Number_of_Unq_Shops_Street_food
,COUNT(DISTINCT CASE WHEN cuisine_parent = 'Traditional'           							THEN shop_id END ) AS Number_of_Unq_Shops_Traditional
,COUNT(DISTINCT CASE WHEN cuisine_parent = 'Creperie'              							THEN shop_id END ) AS Number_of_Unq_Shops_Creperie
,COUNT(DISTINCT CASE WHEN cuisine_parent = 'Ethnic'                							THEN shop_id END ) AS Number_of_Unq_Shops_Ethnic
,COUNT(DISTINCT CASE WHEN cuisine_parent = 'Sweets'                							THEN shop_id END ) AS Number_of_Unq_Shops_Sweets
,COUNT(DISTINCT CASE WHEN cuisine_parent = 'Healthy / Other'       							THEN shop_id END ) AS Number_of_Unq_Shops_Healthy_Other
,COUNT(DISTINCT CASE WHEN cuisine_parent in ('Ethnic' ,'Sweets', 'Healthy / Other')        	THEN shop_id END ) AS Number_of_Unq_Shops_All_Other


/* Calculate KPIs for Number of Orders per Time Slot*/ 
,SUM(CASE WHEN EXTRACT(Hour FROM submit_dt AT TIME ZONE "UTC") BETWEEN 3 AND 11  	THEN 1 ELSE 0 END ) AS Num_of_Orders_Morning	
,SUM(CASE WHEN EXTRACT(Hour FROM submit_dt AT TIME ZONE "UTC") BETWEEN 12 AND 16  	THEN 1 ELSE 0 END ) AS Num_of_Orders_Noon
,SUM(CASE WHEN EXTRACT(Hour FROM submit_dt AT TIME ZONE "UTC") NOT BETWEEN 3 AND 16  	THEN 1 ELSE 0 END ) AS Num_of_Orders_Night
/* Calculate KPIs for value of Orders per Cuisine Type */ 
,SUM(CASE WHEN EXTRACT(Hour FROM submit_dt AT TIME ZONE "UTC") BETWEEN 3 AND 11  	THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Morning	
,SUM(CASE WHEN EXTRACT(Hour FROM submit_dt AT TIME ZONE "UTC") BETWEEN 12 AND 16  	THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Noon
,SUM(CASE WHEN EXTRACT(Hour FROM submit_dt AT TIME ZONE "UTC") NOT BETWEEN 3 AND 16 	THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Night
/* Calculate KPIs for average value of Orders per Cuisine Type */ 
,AVG(CASE WHEN EXTRACT(Hour FROM submit_dt AT TIME ZONE "UTC") BETWEEN 3 AND 11  	THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Morning	
,AVG(CASE WHEN EXTRACT(Hour FROM submit_dt AT TIME ZONE "UTC") BETWEEN 12 AND 16  	THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Noon
,AVG(CASE WHEN EXTRACT(Hour FROM submit_dt AT TIME ZONE "UTC") NOT BETWEEN 3 AND 16  	THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Night

/* Calculate KPIs for High Tickets*/ 
--,SUM(CASE WHEN basket>=9 THEN 1 ELSE 0 END ) 	 AS Num_of_Orders_High_Ticket	
--,SUM(CASE WHEN basket>=9 THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_High_Ticket
--,AVG(CASE WHEN basket>=9 THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_High_Ticket
--,SUM(CASE WHEN basket<9 THEN 1 ELSE 0 END ) 	 AS Num_of_Orders_Low_Ticket	
--,SUM(CASE WHEN basket<9 THEN basket ELSE 0 END ) AS SUM_Value_of_Orders_Low_Ticket
--,AVG(CASE WHEN basket<9 THEN basket ELSE 0 END ) AS AVG_Value_of_Orders_Low_Ticket

/* Calculate KPIs  */ 
,COUNT(*) 					AS Num_of_Orders
,SUM(basket) 				AS SUM_Value_of_Orders	
,AVG(basket)                AS AVG_Value_Per_Order
,COUNT(DISTINCT city)       AS Number_of_Unq_Cities
,COUNT(DISTINCT shop_id)    AS Number_of_Unq_Shops


FROM ad_hoc.orders_jan2021
GROUP BY user_id

