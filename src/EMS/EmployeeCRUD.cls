Class EMS.EmployeeCRUD Extends %RegisteredObject
{

// CRUD like operations using ObjectScript for Employee Management System

ClassMethod Menu() As %Status
{
		Write !,?30,"1.Add Employee"
		Write !,?30,"2.View Employee"
		Write !,?30,"3.Edit Employee"
		Write !,?30,"4.Search Employee"
		Write !,?30,"5.Quit",!
		Read !!,?30,"Enter choice (1-5): ",choice
		
		If choice=1
		{
			Set det=..AddEmployee() 
			Do ..AddEmployeeDetails($PIECE(det,"|",1),$PIECE(det,"|",2),$PIECE(det,"|",3),$PIECE(det,"|",4),$PIECE(det,"|",5),$PIECE(det,"|",6),$PIECE(det,"|",7),$PIECE(det,"|",8),$PIECE(det,"|",9))  
		}
		ElseIf choice=2
		{
			Read !,"Enter the employee Id: ",eid 
			Do ..ViewEmployeeDetails(eid)
		}
		ElseIf choice=3
		{
			Read !,"want to edit every field (y/n)?",ans
			Read !,"Enter the employee Id u want to edit:",eid
			If ans="y" Do ..EditAll(eid)
			Else  Do ..EditField(eid)	
		}
		Else {Write !,"Search utility is remaining"}

        Quit $$$OK
}

ClassMethod AddEmployee() As %String
{
	Write !!!,?10,"Enter Employee Details:"
	Read !!,?10,"Enter Employee Id: ", empid
    Set eid=..EmpVal(empid)  
	Read !,?10,"Enter name: ",name 
	Read !,?10,"Enter designation: ",desig#30 
	Read !,?10,"Enter gender(M or F): ",gender#1 
	Read !,?10,"Enter DOB (mm/dd/yyyy): ",dob
    Set dob=$ZDATEH(dob)    
	Read !,?10,"Enter city: ",city#25 
	Read !,?10,"Enter Date Of Joining (mm/dd/yyyy): ",doj
    Set doj=$ZDATEH(doj)   
	Read !,?10,"Enter country: ",country#25 
	Read !,?10,"Enter emailid: ",emailid

	Set ret=eid_"|"_name_"|"_desig_"|"_gender_"|"_dob_"|"_city_"|"_doj_"|"_country_"|"_emailid
	Quit ret
}

ClassMethod AddEmployeeDetails(empid As %String, name As %String, desig As %String, gender As %String, dob As %Date, city As %String, doj As %Date, country As %String, emailid As %String)
{
	Set addobj=##class(EmployeeDetails).%New()
	
	Set addobj.EmpId=empid
	Set addobj.Name=name
	Set addobj.Desig=desig
	Set addobj.Gender=gender
	Set addobj.DOB=dob
	Set addobj.City=city
	Set addobj.DOJ=doj
	Set addobj.Country=country
	Set addobj.EmailId=emailid
	
	Set sv=addobj.%Save()
	If sv=1 Write !!,?10,"inserted successfully"
}

ClassMethod ViewEmployeeDetails(id As %String)
{
	Set viewobj=##class(EmployeeDetails).%OpenId(id)
	
	Write !,?25,"Details of the employee: ",!
	Write !,?25,"*****************************"
	Write !,?25,"Id: ",viewobj.EmpId
	Write !,?25,"Name: ",viewobj.Name
	Write !,?25,"Designation: ",viewobj.Desig
	Write !,?25,"Gender: ",viewobj.Gender
	Write !,?25,"DOB: ",viewobj.DOB
	Write !,?25,"City: ",viewobj.City
	Write !,?25,"DOJ: ",viewobj.DOJ
	Write !,?25,"Country: ",viewobj.Country
	Write !,?25,"Emailid: ",viewobj.EmailId
	Write !,?25,"*****************************"
}

ClassMethod EditAll(id As %String)
{
	Set editobj=##class(EmployeeDetails).%OpenId(id)
	Set det=..AddEmployee()

	Set editobj.EmpId=$PIECE(det,"|",1)
	Set editobj.Name=$PIECE(det,"|",2)
	Set editobj.Desig=$PIECE(det,"|",3)
	Set editobj.Gender=$PIECE(det,"|",4)
	Set editobj.DOB=$PIECE(det,"|",5)
	Set editobj.City=$PIECE(det,"|",6)
	Set editobj.DOJ=$PIECE(det,"|",7)
	Set editobj.Country=$PIECE(det,"|",8)
	Set editobj.EmailId=$PIECE(det,"|",9)
	
	Set sv=editobj.%Save()
	If sv=1 Write !,"Updated successfully"
}

ClassMethod EditField(id As %String)
{
	Do ..ViewEmployeeDetails(id)
	Set editobj=##class(EmployeeDetails).%OpenId(id)
	Write !!,"What fields u want to edit?",!,"1.empid 2.name 3.desig 4.gender 5.dob 6.city 7.doj 8.country 9.emailid",!
	Read !,"Enter fields (0 to exit):",che
	Set concat=che
	While che'=0
	{
		Read !,"Enter fields:",che
		Set concat=concat_"|"_che	
	}
		
	Set count=2
	Set ch=$PIECE(concat,"|",1)
	While ch'=0
	{
		If ch=1
		{
			Read !!,"Enter the new employee id:",eid 
			Set editobj.EmpId=eid
			Do ..Repeat(editobj)	
		}
	
		ElseIf ch=2
		{
			Read !!,"Enter the new name:",name
			Set editobj.Name=name
			Do ..Repeat(editobj)
		}
	
		ElseIf ch=3
		{
			Read !!,"Enter the new desig:",desig
			Set editobj.Desig=desig
			Do ..Repeat(editobj)
		}
	
		ElseIf ch=4
		{
			Read !!,"Enter the new gender:",gender
			Set editobj.Gender=gender
			Do ..Repeat(editobj)
		}
	
		ElseIf ch=5
		{
			Read !!,"Enter the new dob:",dob
			Set editobj.DOB=dob
			Do ..Repeat(editobj)
		}
	
		ElseIf ch=6
		{
			Read !!,"Enter the new city:",city
			Set editobj.City=city
			Do ..Repeat(editobj)
		}
	
		ElseIf ch=7
		{
			Read !!,"Enter the new doj:",doj
			Set editobj.DOJ=doj
			Do ..Repeat(editobj)
		}
	
		ElseIf ch=8
		{
			Read !!,"Enter the new country:",country
			Set editobj.Country=country
			Do ..Repeat(editobj)
		}
	
		ElseIf ch=9
		{
			Read !!,"Enter the new emailid:",emailid
			Set editobj.EmailId=emailid
			Do ..Repeat(editobj)
		}
		
		Set ch=$PIECE(concat,"|",count)
		Set count=count+1
	}
}

ClassMethod Repeat(editobj As EmployeeDetails)
{
	Set sv=editobj.%Save()
	If sv=1 {Write !,"Updated successfully"}
	Else {Write !,"Some error"}
}

ClassMethod EmpVal(eid) As %Integer
{
	If eid=""
	{
		Write !,"Employee Id is mandatory"
		Read !,"Enter employee id: ",eid
		Quit eid
	}
    Quit eid
}

}
