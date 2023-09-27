global class newscheduling implements system.Schedulable
{
 
    global void execute(system.SchedulableContext sjobs)
    {
        batchprogrammingclass newobject = new batchprogrammingclass();
        database.executeBatch(newobject , 5);
      
        
    }
}