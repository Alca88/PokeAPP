# PokeAPP
## Objetos

    COMO Maestr@ Pokemon
    NECESITO Guardar la informacion de los Pokemon
    PARA tener la informacion cuando la necesite

    DADO que necesito guardar los pokemon
    CUANDO obtenga los datos
    ENTONCES debo crear el siguiente Objeto : Pokemon


    COMO Maestr@ Pokemon
    NECESITO identificar los Movimientos
    PARA tener la informacion guardada

    DADO que necesito identificar los movimientos
    CUANDO obtenga los datos
    ENTONCES debo crear el siguiente Objeto : Movimiento


    COMO Maestr@ Pokemon
    NECESITO identificar las Habilidades
    PARA tener la informacion guardada

    DADO que necesito identificar las habilidades
    CUANDO obtenga los datos
    ENTONCES debo crear el siguiente Objeto : Habilidad

## Campos

    COMO Maestr@ Pokemon
    NECESITO identificar los detalles de los Pokemon
    PARA tener la informacion guardada

    DADO que necesito campos para identificar los detalles de los pokemon
    CUANDO inserte el objeto        
    ENTONCES debo crear los siguientes campos:
        -. ExtId (Id de referencia con API) * (ID)
        -. Generacion (Campo formula devolucion numero) * (formula con ExtId)

        -. Habilidad (LookUp habilidad) 
        -. Altura (ej. 2 mts.) (heigth) 
        -. Peso (ej. 2 kg.)(weigth)
        -. Nombre (name) (Primera letra en mayuscula ej. Pikachu)
        -. Imagen (URL) (a eleccion en sprites)
        -. Tipos (Multi Picklist) * (types)
            Normal
            Fighting
            Flying
            Poison
            Ground
            Rock
            Bug
            Ghost
            Steel
            Fire
            Water
            Grass
            Electric
            Psychic
            Ice
            Dragon
            Dark
            Fairy
        -. Vida (stats-hp)
        -. Velocidad (stats-speed)
        -. Defensa (stats-defense)
        -. Ataque (stats-attack)
        -. Slot1 (Lookup Movimiento)
        -. Slot2 (Lookup Movimiento)
        -. Slot3 (Lookup Movimiento)
        -. Slot4 (Lookup Movimiento)


    COMO Maestr@ Pokemon
    NECESITO identificar en los detalles de los Movimientos
    PARA tener la informacion guardada

    DADO que necesito campos para identificar los detalles de los movimientos
    CUANDO inserte el objeto
    ENTONCES debo crear los siguientes campos:
        -. ExtId (Id de referencia con API) (id)
        -. Punteria (accuracy)
        -. Chance de Efecto (effect_chance)
        -. Objetivo (target-name)
        -. Prioridad (priority)
        -. Efecto (Text Area) (effect_entries-short_effect) 
        -. Nombre (name) (Primera letra en mayuscula ej. Karate-chop)
        -. Poder (power)
        -. Pp (pp)
        -. Tipo (Multi Picklist)  (type-name)
            Normal
            Fighting
            Flying
            Poison
            Ground
            Rock
            Bug
            Ghost
            Steel
            Fire
            Water
            Grass
            Electric
            Psychic
            Ice
            Dragon
            Dark
            Fairy
            Unknown
            Shadow


    COMO Maestr@ Pokemon
    NECESITO identificar en los detalles de las Habilidades
    PARA tener la informacion guardada

    DADO que necesito campos para identificar los detalles de las habilidades
    CUANDO inserte el objeto
    ENTONCES debo crear los siguientes campos:
        -. ExtId (Id de referencia con API)
        -. Efecto (Effect_Entries-short_effect en ingles EN)
        -. Nombre (name) (Primera letra en mayuscula ej. Speed-boost)

## Layout

        COMO Maestr@ Pokemon
        NECESITO tener un layout de Pokemon
        PARA poder acceder a la data mas facilmente

        DADO que necesito poder ver la data de los Pokemon
        CUANDO ingrese al detalle
        ENTONCES debo crear un layout para organizar la informacion de los Pokemon


        COMO Maestr@ Pokemon
        NECESITO tener un layout de Habilidad
        PARA poder acceder a la data mas facilmente

        DADO que necesito poder ver la data de las Habilidades
        CUANDO ingrese al detalle
        ENTONCES debo crear un layout para organizar la informacion de las Habilidades


        COMO Maestr@ Pokemon
        NECESITO tener un layout de Movimiento
        PARA poder acceder a la data mas facilmente

        DADO que necesito poder ver la data de los Movimientos
        CUANDO ingrese al detalle
        ENTONCES debo crear un layout para organizar la informacion de los Movimientos

## Tabs

    COMO Maestr@ Pokemon
    NECESITO tener una tab de Pokemon
    PARA poder acceder a la data mas facilmente

    DADO que necesito poder ver los Pokemon
    CUANDO ingrese al detalle
    ENTONCES debo crear una tab para los Pokemon


    COMO Maestr@ Pokemon
    NECESITO tener una tab de Habilidad
    PARA poder acceder a la data mas facilmente

    DADO que necesito poder ver las Habilidades
    CUANDO ingrese al detalle
    ENTONCES debo crear una tab las Habilidades


    COMO Maestr@ Pokemon
    NECESITO tener una tab de Movimiento
    PARA poder acceder a la data mas facilmente

    DADO que necesito poder ver los Movimientos
    CUANDO ingrese al detalle
    ENTONCES debo crear una tab para los Movimientos
    

    COMO Maestr@ Pokemon
    NECESITO tener una tab de Pokedex
    PARA poder acceder a la pokedex
## App

    COMO Maestr@ Pokemon
    QUIERO crear la APP PokeAPP
    PARA visualizar registros

    Criterios de aceptaciÃ³n
    Incluir las Tab Pokemon/Habilidad/Movimiento/Pokedex dentro de la APP PokeAPP
## RemoteSiteSettings

    COMO Maestr@ Pokemon
    QUIERO conectarme a https://pokeapi.co/
    PARA obtener registros

    Criterios de aceptaciÃ³n
    DADO que quiero conectarme a https://pokeapi.co/
    CUANDO se realice la conexiÃ³n
    ENTONCES Salesforce deberÃ¡ de tener los permisos necesarios
## Clases

    COMO Maestr@ Pokemon
    NECESITO una clase
    PARA obtener todos los movimientos de un pokemon (hasta el indice 826 inclusive)

    DADO que necesito obtener los movimientos de un pokemon
    CUANDO -
    ENTONCES debo crear una clase la cual me permita consultar la api POKEAPI.CO, insertar los movimientos y relacionarlos a los pokemon correspondientes (cada pokemon tendra un maximo 4 movimientos elegidos al azar) (En caso de que la informacion venga vacia de la API no debere guardar nada en el campo)


    COMO Maestr@ Pokemon
    NECESITO una clase
    PARA obtener todos las Habilididades de los pokemon (hasta el indice 267 inclusive)

    DADO que necesito obtener las Habilididades de un pokemon
    CUANDO -
    ENTONCES debo crear una clase la cual me permita consultar la api POKEAPI.CO insertar las habilidades y relacionarlas a los pokemon correspondientes (cada pokemon tendra un maximo de 1 habilidad elegida al azar) (En caso de que la informacion venga vacia de la API no debere guardar nada en el campo)


    COMO Maestr@ Pokemon
    NECESITO una clase
    PARA obtener todos los pokemons (hasta el indice 898 inclusive)

    DADO que necesito obtener los pokemon
    CUANDO ejecute la clase
    ENTONCES debo crear una clase la cual me permita consultar la api POKEAPI.CO, obtener los pokemons e insertar los datos en los objetos correspondientes. (En caso de que la informacion venga vacia de la API no debere guardar nada en el campo)
    
    IMPORTANTE: guardar relaciÃ³n entre movimiento/habilidad y pokemon. Si la cantidad de movimientos/habilidades que trae la API supera la cantidad de espacios disponibles que cuenta el pokemon, guardar movimientos (4) / habilidades (1). En caso de que la API traiga MENOS movimientos (4) / habilidades (1), solo guardar los movimientos/habilidades que la API indique.
## LWC

HU -VisualizaciÃ³n de registros-

COMO Maestr@ Pokemon
QUIERO visualizar registros
PARA armar mi Pokedex

Criterios de aceptaciÃ³n
DADO que cuento con los 898 pokemons insertados correctamente en mi Org
CUANDO ingrese a la tab Pokedex
ENTONCES deberÃ© de visualizarlos en filas, siguiendo el orden del Ã­ndice propio de cada registro


HU -Filtrado por picklist-

COMO Maestr@ Pokemon
QUIERO filtrar registros
PARA refinar mi bÃºsqueda

Criterios de AceptaciÃ³n
DADO que visualizo todos los PokÃ©mon
CUANDO quiera acotar mi bÃºsqueda
ENTONCES deberÃ© de tener dos picklist para refinar mi bÃºsqueda

- filtrar resultados por Tipo (recordar que tipo es multi picklist)
- filtrar resultados por generaciÃ³n

* DeberÃ© de tener opciÃ³n seleccionar "Todos" en los filtros
* Podre realizar ambos filtrados en simultaneo. Ej. podre buscar todos los PokÃ©mon de Tipo Normal de la generaciÃ³n 5


HU -Filtrado por nombre-

COMO Maestr@ Pokemon
QUIERO filtrar registros
PARA refinar mi bÃºsqueda

Criterios de aceptaciÃ³n
DADO que visualizo todos los PokÃ©mon
CUANDO quiera acotar mi bÃºsqueda
ENTONCES deberÃ© de tener un campo input para refinar mi bÃºsqueda

* Este filtrado podrÃ¡ realizarse en simultaneo con los filtros previamente creados
Ej. ingreso la letra "a", la bÃºsqueda deberÃ¡ devolverme todos los PokÃ©mon que CONTENGAN la letra "a", no necesariamente que empiecen por la letra "a".


HU -Contador de registros-

COMO Maestr@ Pokemon
QUIERO mostrar el numero de registros 
PARA saber cuantos PokÃ©mon pertenecen a una generaciÃ³n, a un tipo, etc

Criterios de AceptaciÃ³n
*Debo de visualizar un contador que cuando aplique un filtro, cuente el numero de resultados
-hint- Investigar la funciÃ³n Object.keys en JavaScript


HU -Estilos-

Criterios de AceptaciÃ³n
DeberÃ© aplicar estilos sobre el trabajo previamente construido para una visualizaciÃ³n mas bella.
*Los estilos que se utilizaran son a criterio personal, dejen volar la imaginaciÃ³n. Preferentemente apegarse a SLDS


HU -RedirecciÃ³n a Record Page-

COMO Maestr@ Pokemon
QUIERO hacer click sobre la imagen de mi PokÃ©mon
PARA redirigirme hacia el registro de mi PokÃ©mon

Criterios de aceptaciÃ³n
Una vez que realice click sobre la imagen de mi PokÃ©mon, deberÃ¡ de redirigirme a la pÃ¡gina de su registro
-hint- Investigar la funciÃ³n de NavigationMixin en JavaScript
