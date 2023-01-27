import { LightningElement, wire } from 'lwc';
import getFilteredPokemons from '@salesforce/apex/PokedexCtrl.getFilteredPokemons';

export default class PokeList extends LightningElement {
    //properties
    searchText = '';
    valueGeneracion = '';
    valueTipo1 = '';
    valueTipo2 = '';

    //wire
    @wire(getFilteredPokemons, { searchText : '$searchText'})
    pokemon;

    //connectedCallback(){console.log("CONSOLELOG"+pokemon)}
    //renderedCallback(){console.log("CONSOLELOG"+pokemon)}

    //methods
    handleInputChange(event){
        const searchTextAux = event.target.value;
        if (searchTextAux.length >=3 || searchTextAux == ''){
        this.searchText = searchTextAux;
        }
        console.log(this.pokemon)
    }

    handleGeneracionChange(event) {
        this.valueGeneracion = event.target.valueGeneracion;

         //code get optionsGeneracion
    }

    get optionsGeneracion() {
        return [
            { label: 'Todos', valueGeneracion: '' }, //esto va con un if 
            { label: 'Generación 1', valueGeneracion: '' },
            { label: 'Generación 2', valueGeneracion: '' },
            { label: 'Generación 3', valueGeneracion: '' },
            { label: 'Generación 4', valueGeneracion: '' },
            { label: 'Generación 5', valueGeneracion: '' },
            { label: 'Generación 6', valueGeneracion: '' },
            { label: 'Generación 7', valueGeneracion: '' },
            { label: 'Generación 8', valueGeneracion: '' },
        ];
    }

    handleTiposChange(event) {
        this.valueTipo1 = event.target.valueTipo1;

        //code get optionstipos
    }

    get optionsTipos() {
        return [
            { label: 'Todos', valueTipo1: '' }, //esto va con un if 
            { label: 'Normal', valueTipo1: '' },
            { label: 'Fighting', valueTipo1: '' },
            { label: 'Flying', valueTipo1: '' },
            { label: 'Poison', valueTipo1: '' },
            { label: 'Ground', valueTipo1: '' },
            { label: 'Rock', valueTipo1: '' },
            { label: 'Bug', valueTipo1: '' },
            { label: 'Ghost', valueTipo1: '' },
            { label: 'Steel', valueTipo1: '' },
            { label: 'Fire', valueTipo1: '' },
            { label: 'Water', valueTipo1: '' },
            { label: 'Grass', valueTipo1: '' },
            { label: 'Electric', valueTipo1: '' },
            { label: 'Psychic', valueTipo1: '' },
            { label: 'Ice', valueTipo1: '' },
            { label: 'Dragon', valueTipo1: '' },
            { label: 'Dark', valueTipo1: '' },
            { label: 'Fairy', valueTipo1: '' },
        ];
    }

    handleTiposChange2(event) {
        this.valueTipo2 = event.target.valueTipo2;

         //code get optionstipos2
    }

    get optionsTipos2() {
        return [
            { label: 'Todos', valueTipo2: '' }, //esto va con un if 
            { label: 'Normal', valueTipo2: '' },
            { label: 'Fighting', valueTipo2: '' },
            { label: 'Flying', valueTipo2: '' },
            { label: 'Poison', valueTipo2: '' },
            { label: 'Ground', valueTipo2: '' },
            { label: 'Rock', valueTipo2: '' },
            { label: 'Bug', valueTipo2: '' },
            { label: 'Ghost', valueTipo2: '' },
            { label: 'Steel', valueTipo2: '' },
            { label: 'Fire', valueTipo2: '' },
            { label: 'Water', valueTipo2: '' },
            { label: 'Grass', valueTipo2: '' },
            { label: 'Electric', valueTipo2: '' },
            { label: 'Psychic', valueTipo2: '' },
            { label: 'Ice', valueTipo2: '' },
            { label: 'Dragon', valueTipo2: '' },
            { label: 'Dark', valueTipo2: '' },
            { label: 'Fairy', valueTipo2: '' },
        ];
    }
}

