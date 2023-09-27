trigger leadrecord1 on Lead (before insert , before update) 
{
    if((trigger.isinsert || trigger.isupdate)&& trigger.isbefore)
    {
        for (lead newlead : trigger.new)
        {
            
            if(newlead.rating == 'hot')
            {
                if(newlead.industry == null || newlead.industry == '')
                    newlead.adderror('enter the industry value');
            }
         
            
                
            
        }
    }
}