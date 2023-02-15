import { LightningElement, wire } from 'lwc';
import getFilteredPokemons from '@salesforce/apex/PokedexCtrl.getFilteredPokemons';

export default class PokeList extends LightningElement {
    //properties, gets
    searchText = '';
    valueGeneracion = '';
    valueTipo1 = '';
    valueTipo2 = '';
    contador = null;

    optionsGeneracion = [
        { label: 'Todas', value: ''},
        { label: 'Generación 1', value: '1' },
        { label: 'Generación 2', value: '2' },
        { label: 'Generación 3', value: '3' },
        { label: 'Generación 4', value: '4' },
        { label: 'Generación 5', value: '5' },
        { label: 'Generación 6', value: '6' },
        { label: 'Generación 7', value: '7' },
        { label: 'Generación 8', value: '8' }
    ]

    optionsTipos = [
		{ label : 'Todos', value: ''},
        { label : 'Acero', value: 'Steel'},
        { label : 'Agua', value: 'Water'},
		{ label : 'Bicho', value: 'Bug'},
        { label : 'Dragón', value: 'Dragon'},
		{ label : 'Eléctrico', value: 'Electric'},
        { label : 'Fantasma', value: 'Ghost'},
        { label : 'Fuego', value: 'Fire'},
		{ label : 'Hada', value: 'Fairy'},
        { label : 'Hielo', value: 'Ice'},
        { label : 'Normal', value: 'Normal'},
        { label : 'Oscuro', value: 'Dark'},
		{ label : 'Pelea', value: 'Fighting'},
		{ label : 'Planta', value: 'Grass'},
        { label : 'Psíquico', value: 'Psychic'},
        { label : 'Roca', value: 'Rock'},
        { label : 'Tierra', value: 'Ground'},
        { label : 'Veneno', value: 'Poison'},
		{ label : 'Volador', value: 'Flying'}
	]

    //wire
    @wire(getFilteredPokemons, { searchText : '$searchText', valueGeneracion : '$valueGeneracion', valueTipo1 : '$valueTipo1', valueTipo2 : '$valueTipo2'})
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
        this.valueGeneracion = event.target.value;
       
    }

    handleTiposChange(event) {
        this.valueTipo1 = event.target.value;

    }

    handleTiposChange2(event) {
        this.valueTipo2 = event.target.value;

    }

    contadorRegistros(event) {
        const contadorAux = event.target.value;
        contadorAux = Object.keys(pokemon).length;
        this.contador = contadorAux;
    }

    
}