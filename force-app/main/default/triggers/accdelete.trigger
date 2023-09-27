trigger accdelete on Account (after insert) 
{ 
    list<account> newacc = new list<account>();
    list<account> lstaccount = [select id , name from account where name like 'text%'];
    for(account newaccount:lstaccount)
    {
        newacc.add(newaccount);
    }
    delete newacc;
    
   
 
}