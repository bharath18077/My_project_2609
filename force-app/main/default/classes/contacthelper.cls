public class contacthelper 
{
    public static void createcontacthelper( string dept , string lname,string mail , string pnumber,string fnumber )
    {
        contact con =new contact();
        
        con.Department = dept;
        con.LastName = lname;
        con.Email = mail;
        con.Phone = pnumber;
        con.fax = fnumber;
        insert con;
        if (con.id != null)
        {
            system.debug('the contact id is '+ con.id);
            createtaskhelper( 'status' ,  'nsubject' ,  'prior', 'conid' );
            
            
           
        }
    } 
    public static void createtaskhelper(string status , string nsubject , string prior, id  conid )
    {
        task tacode = new task();
        tacode.Status = status;
        tacode.Subject = nsubject;
        tacode.Priority = prior;
        tacode.whoid = conid;
        
        insert tacode;
        if(tacode.id != null)
            system.debug('the task id is '+ tacode.id);
    }

}