public class acc {
    list<account> lstacc = [select id , name , phone ,(select id , lastname from contacts) from account where name = 'test'];

}