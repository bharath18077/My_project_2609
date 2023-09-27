public class exampleclasslist 
{ 
    public static void createnewlist(account idname)
    {
    
    list<sobject> listexample = new list<sobject>();
    listexample.add(idname);
        system.debug(listexample);
    }
}