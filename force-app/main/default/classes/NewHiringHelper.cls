public class NewHiringHelper 
{
    Public static void CreateHRRecord(String hrName, String hrEmail, String hrCity, 
                                      		String hrPhone, String hrTitle, Decimal hrSalary)
    {
        Hiring_Manager__C hrRecord = new Hiring_Manager__c();
        
        	hrRecord.Name = hrName;
        	hrRecord.Loaction__c = hrCity;
        	hrRecord.Email_id__c = hrEmail;
        	hrRecord.Contact_Number__c = hrPhone;
        	hrRecord.Designation__c = hrTitle;
        	hrRecord.Current_CTC__c = hrSalary;
        
        Insert hrRecord;
        
        if(hrRecord.Id != Null)
            System.debug('Hiring Manager Record Id is.....: '+ hrRecord.Id);
    }
}