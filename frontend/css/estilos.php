   <?php
   header('Content-type: text/css');
   $color_principal = '#007bff'; // Ejemplo de variable
   $tamano_fuente = '16px';
   
   if (isset($_GET['tema']) && $_GET['tema'] == 'oscuro') {
       $color_principal = '#343a40';
       $tamano_fuente = '18px';
   }
   ?>
   body {
       background-color: <?php echo $color_principal; ?>;
       font-size: <?php echo $tamano_fuente; ?>;
   }
   a {
       color: <?php echo $color_principal; ?>;
   }