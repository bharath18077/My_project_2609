import { LightningElement } from 'lwc';

export default class Lwc_1704_eg1_datainput extends LightningElement 
{
    nam;
    capname(event)
    {
        this.nam=event.target.value;

    }
    callme(event)
    {
        alert('hi' + this.nam);
    }
}