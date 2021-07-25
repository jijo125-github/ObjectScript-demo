Class EMS.EmployeeDetails Extends %Persistent
{

Property EmpId As %String [ Required, SqlColumnNumber = 2 ];

Property Name As %String [ Required, SqlColumnNumber = 3 ];

Property Desig As %String [ SqlColumnNumber = 4 ];

Property Gender As %String [ SqlColumnNumber = 5 ];

Property DOB As %Date [ SqlColumnNumber = 6 ];

Property City As %String [ SqlColumnNumber = 7 ];

Property DOJ As %Date [ SqlColumnNumber = 8 ];

Property Country As %String [ SqlColumnNumber = 9 ];

Property EmailId As %String [ SqlColumnNumber = 10 ];

Storage Default
{
<Data name="EmployeeDetailsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>EmpId</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>Desig</Value>
</Value>
<Value name="5">
<Value>Gender</Value>
</Value>
<Value name="6">
<Value>DOB</Value>
</Value>
<Value name="7">
<Value>City</Value>
</Value>
<Value name="8">
<Value>DOJ</Value>
</Value>
<Value name="9">
<Value>Country</Value>
</Value>
<Value name="10">
<Value>EmailId</Value>
</Value>
</Data>
<DataLocation>^EMS.EmployeeDetailsD</DataLocation>
<DefaultData>EmployeeDetailsDefaultData</DefaultData>
<IdLocation>^EMS.EmployeeDetailsD</IdLocation>
<IndexLocation>^EMS.EmployeeDetailsI</IndexLocation>
<StreamLocation>^EMS.EmployeeDetailsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
