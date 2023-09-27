trigger accountcontactupdate on Account (after insert , after update) 
{
   if(trigger.isafter && (trigger.isinsert || trigger.isupdate))
   {
       list<contact> newcontact = NEW LIST<CONTACT>();
       
       for(ACCOUNT NEWACC : TRIGGER.NEW)
          
       {
           list<contact> newcontactS = [select id , firstname , lastname  , accountid from contact where accountid =: NEWACC.ID ];
           FOR(CONTACT CON : NEWCONTACTS )
           {
               CON.EMAIL = NEWACC.EMAIL_ID__C;
               NEWCONTACT.ADD(CON);
               
                   
           }
           update newconTACT;
           
       }
       
       update newconTACT;
   }
}