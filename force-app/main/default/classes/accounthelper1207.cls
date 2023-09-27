public class accounthelper1207 
{
    public static void createaccount1207()
    {
        account accacount12 = new account();
        accacount12.name = 'bharath12';
        accacount12.phone = '819116295';
        insert accacount12;
        if(accacount12.id != null)
            system.debug('the record is ' + accacount12.id);
    }

}