Class dc.PackageSample.GetCurrentTime
{

// ClassMethod to get the date and time in horolog format

ClassMethod getCurrentTime() As %Status
{
    Set datetime = $HOROLOG
    Set date = $PIECE(datetime,",",1)
    Set time = $PIECE(datetime,",",2)
    Write !!, "Today's date in horolog form is "_date
    Write !, "Today's time in horolog form is "_time
    Quit $$$OK
}

}
