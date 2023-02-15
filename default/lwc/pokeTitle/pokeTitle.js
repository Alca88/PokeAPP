import { LightningElement, api} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class pokeTitle extends NavigationMixin(LightningElement) {

   @api pokemon; //revisar si estoy usando *
   @api pokemonid;
   @api name;
   @api imagen;
   @api extid;
   @api generacion;


    /*pokemon dummy = {
        Imagen__c: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
        ExtId__c: "4",
        Generacion__c: "1",
    };*/
    
    navigateToRecordViewPage() {
        // View a custom object record.
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.pokemonid,
                objectApiName: 'Pokemon__c', 
                actionName: 'view'
            }
        });
    }

}