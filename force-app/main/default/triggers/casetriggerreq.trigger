trigger casetriggerreq on Lead (before insert , before update) 
{
     if(trigger.isbefore && (trigger.isinsert || trigger.isupdate))
     {
         for(lead abc : trigger.new)
         {
             If(abc.Rating == 'Hot' )
             {
                 if(abc.City == null || abc.City == '')
                 {
                     abc.city.adderror('enter the valid address');
                 }
             }
                 
             
         }
     }

}