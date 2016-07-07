DROP PROCEDURE IF EXISTS `UpdateUserType`;
DELIMITER |
CREATE   PROCEDURE `UpdateUserType`(
 in email_Id varchar(50)
,in user_Type tinyInt(4)
)
BEGIN
/*
userType : 
          0 - Normal
          1 - Demo
          2 - Normal Test
          3 - Demo Test

*/
declare statusValue bit(1);
set statusValue=0;

	update scUser set userType=user_Type
	where emailId=email_Id;
	if row_count()>0 then
		set statusValue=1;	
	end if ;

select   statusValue,user_Type;
END