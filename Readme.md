COMANDOS PARA EJECUTAR DESDE VENTANA ANÓNIMA



CARGA DE REGISTROS:

list<integer> abtys = new list<integer>();
for (integer i = 1 ; i <= 1 ; i++){
abtys.add(i);
}
GETClass batch = new GETClass(abtys);
database.executeBatch(batch, 1);
                        
                          
BORRAR REGISTROS:

delete [
SELECT Id
FROM SObject
];
