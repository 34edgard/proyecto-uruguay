<?php

use Liki\Database\SchemaBuilder;  
use Liki\Database\ConexionesBD;  
  
return new class {  
public function up() {  
    $schema = new SchemaBuilder();  
      
    $sql = $schema->createTable('estudiante', function($table) {  
        $table->integer('ci_escolar')->primary('ci_escolar');  
        $table->string('nombres', 30)->notNull();  
        $table->string('apellidos', 30)->notNull();  
        $table->date('fecha_nacimiento')->notNull();  
        $table->integer('id_lugar_nacimiento')->notNull();  
        $table->integer('id_nacionalidad')->notNull();  
        $table->integer('edad_ano')->notNull();  
        $table->integer('edad_meses')->notNull();  
        $table->enum('sexo', ['masculino', 'femenino'])->notNull();  
        $table->integer('id_ubicacion')->notNull();  
        $table->integer('id_procedencia')->notNull();  
          
   
    });
        
 }
};