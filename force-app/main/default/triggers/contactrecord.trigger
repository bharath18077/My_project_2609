trigger contactrecord on Contact (before insert , before update) 
{
   if((trigger.isinsert || trigger.isupdate ) && trigger.isbefore)
   {
       for (contact newcontact:trigger.new)
       {
           if(newcontact.phone == null || newcontact.phone =='')
               newcontact.adderror('plz enter the phone field value');
           if(newcontact.Email == null || newcontact.email =='' )   
                newcontact.adderror('plz enter the email field value');
       }
   }
}