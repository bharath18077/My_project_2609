import { LightningElement } from 'lwc';

export default class Lwc_1704_eg2_greaterof3num extends LightningElement 
{
    result;
    num1;
    num2;
    num3;
    fnum(event)
    {
        this.num1 = event.target.value;
    }
    snum(event)
    {
        this.num2 = event.target.value;
    }
    tnum(event)
    {
        this.num3 = event.target.value;
    }
    calcme(event)
    {
        if(parseInt(this.num1)>parseInt(this.num2) && parseInt(this.num1)>parseInt(this.num3))
        {
            this.result = this.num1;
        }
        else if(parseInt(this.num2)>parseInt(this.num1) && parseInt(this.num2)>parseInt(this.num3))      
         {
            this.result = this.num2;
        }
        else
        {
            this.result = this.num3;
        }
    }
    clearme(event)
    {
        this.num1= null;
        this.num2 = null;
        this.num3 =null;
        this.result =null;
    }
    

}