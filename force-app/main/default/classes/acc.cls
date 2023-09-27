public class acc {//changes made fro the 2nd time
    
    list<account> lstacc = [select id , name , phone ,(select id , lastname from contacts) from account where name = 'test'];

}