<?php



use App\Plantel\Aulas;


return new  class  {
  public static function run($p,$f) {
    
    
   extract($p);


    (new Aulas)->registrar([
      "campos"=>['id_seccion','nombre_aula'],
      "valores"=>[$id_seccion,$nombre_aula]
    ]);

   $f[0]();
  }
};
