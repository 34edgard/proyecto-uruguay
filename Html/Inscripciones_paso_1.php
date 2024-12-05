
        
        
        <form action="Pag_3.2.php" method="post">
            <fieldset class="container-fluid  img-thumbnail row">
                

  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item" role="presentation">
      <button type="button" class="nav-link active" data-bs-toggle="tab" data-bs-target="#niño" role="tab" aria-selected="true">datos del niño/ña</button>
    </li>

    <li class="nav-item" role="presentation">
      <button type="button" class="nav-link" data-bs-toggle="tab" data-bs-target="#madre" role="tab">datos de la madre </button>
    </li>
    <li class="nav-item" role="presentation">
      <button type="button" class="nav-link" data-bs-toggle="tab" data-bs-target="#padre" role="tab">datos de la padre </button>
    </li>
    <li class="nav-item" role="presentation">
      <button type="button" class="nav-link" data-bs-toggle="tab" data-bs-target="#representante" role="tab">datos de la representante</button>
    </li>

  </ul>

  <div class="tab-content" role="tablist">
    <div class="tab-pane active table-responsive" id="niño" role="tabpanel">
    <legend class="legend"><u> 1-datos del niño o niña:</u></legend>
                    <label class="control-label col-md-6 themed-grid-col"
                        >apellidos:

                        <input require 
                            tipe="text"
                            name="Datos_Niño_Apellidos"
                            placeholder="apellidos"
                            class="form-control m-1"
                            id="apellidos"
                        />
                    </label>

                    <label class="control-label col-md-6 themed-grid-col" 
                        >nombres:

                        <input require 
                            type="text"
                            name="Datos_Niño_Nombres"
                            placeholder="nombres"
                            class="form-control m-1"
                            id="nombres"
                        />
                    </label>

                    <label class="control-label m-1 col-md-3 themed-grid-col" 
                        >fecha de nacimiento:

                        <input require 
                            type="date"
                            name="Datos_Niño_Fecha"
                            placeholder="fecha de nacimiento"
                            class="form-control m-1"
                            id="fecha"
                        />
                    </label>

                    <label class="control-label m-1 p-1 col-md-4 themed-grid-col" 
                        >lugar de nacimiento:

                        <select
                            name="Datos_Niño_Lugar_Nacimiento"
                            class="form-control m-1"
                            id="procedencia"
                            id="lugar"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label  class="m-1 p-1 col-md-3 themed-grid-col"
                        >procedencia:
                        <select
                            name="Datos_Niño_Procedencia"
                            class="form-control m-1"
                            id="procedencia"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="control-label m-1 p-1 col-md-3 themed-grid-col" 
                        >municipio:
                        <select
                            name="Datos_Niño_Municipio"
                            class="form-control m-1"
                            id="municipio"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="control-label m-1 p-1 col-md-3 themed-grid-col" 
                        >estado:
                        <select
                            name="Datos_Niño_Estado"
                            class="form-control m-1"
                            id="estado"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="control-label m-1 p-1 col-md-3 themed-grid-col" 
                        >nacionalidad:
                        <select
                            name="Datos_Niño_Nacionalidad"
                            placeholder="nacionalidad"
                            class="form-control m-1"
                            id="nacionalidad"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="control-label col-md-2 themed-grid-col"    >sexo:
                        <select
                            name="Datos_Niño_Sexo"
                            id="sexo"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>
                 
                    <label class="control-label m-1 p-1 col-md-4 themed-grid-col"
                        >teléfono
                        <input require 
                            type="tel"
                            name="Datos_Niño_Telefono"
                            placeholder="teléfono"
                            class="form-control m-1"
                            id="teléfono"
                        />
                    </label>

                    <label class="control-label m-1 p-1 col-md-3 themed-grid-col">
                        Talla de camisa
                        <input require 
                            type="text"
                            name="Datos_Niño_Talla_Camisa"
                            class="form-control m-1"
                            id="Talla_camisa"
                        />
                    </label>
                    <label class="control-label m-1 p-1 col-md-3 themed-grid-col" >
                        pantalón
                        <input require 
                            type="text"
                            name="Datos_Niño_Talla_PadrendaPantalon"
                            class="form-control m-1"
                            id="pantalon"
                        />
                    </label>
                    <label class="control-label m-1 p-1 col-md-3 themed-grid-col" >
                        zapato
                        <input require 
                            type="text"
                            name="Datos_Niño_Talla_Zapato"
                            id="zapato"
                            class="form-control m-1"
                        />
                    </label>

                    <label class="control-label m-1 p-1 col-md-3 themed-grid-col" >
                        peso

                        <input require 
                            type="text"
                            name="Datos_Niño_Talla_Peso"
                            class="form-control m-1"
                            id="peso"
                        />
                    </label>

                    <label class="control-label m-1 p-1 col-md-3 themed-grid-col" >
                        talla
                        <input require 
                            type="text"
                            name="Datos_Niño_Talla"
                            class="form-control m-1"
                            id="talla"
                        />
                    </label>

                    <label class="control-label m-1 p-1 col-md-3 themed-grid-col" >
                        circunferencia braquial

                        <input require 
                            type="text"
                            name="Datos_Niño_Talla_Circunferencia_Braquial"
                            class="form-control m-1"
                            id="cb"
                        />
                    </label>

                    <h4 class="text-primary">direccion</h4>

                    <label class="control-label col-md-4 themed-grid-col"
                        >calle
                        <select
                            name="Datos_Niño_Calle"
                            class="form-control m-1"
                        >
                                                  </select>
                    </label>

                    <label class="control-label col-md-4 themed-grid-col"
                        >sector
                        <select
                            name="Datos_Niño_Sector"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="control-label col-md-4 themed-grid-col"
                        >parroquia
                        <select
                            name="Datos_Niño_Padrerroquia"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <h4 class="text-primary">datos medicos</h4>

                    <label class="control-label col-md-4 themed-grid-col"
                        >estado nutricional
                        <select
                            name="Datos_Niño_Estado_Nutricional"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="control-label col-md-4 themed-grid-col"
                        >condicion medica
                        <select
                            name="Datos_Niño_Condicion_medica"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="control-label col-md-4 themed-grid-col"
                        >discapacidad
                        <select
                            name="Datos_Niño_Discapacidad"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                
                

              

    </div>

    <div class="tab-pane table-responsive" id="madre" role="tabpanel">

                    <h3><u>2-Datos de la Madre:</u></h3>

                    <label class="col-md-6 themed-grid-col"
                        >Apellidos de la Madre:
                        <input require 
                            type="text"
                            name="Datos_familiares_Madre_Apellidos"
                            class="form-control m-1"
                        />
                    </label>

                    <label class="col-md-6 themed-grid-col">
                        nombres de la Madre:
                        <input require 
                            type="text"
                            name="Datos_familiares_Madre_Nombres"
                            class="form-control m-1"
                        />
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >C.I:
                        <input require 
                            type="text"
                            name="Datos_familiares_Madre_Cedula"
                            class="form-control m-1"
                        />
                    </label>

                    <label class="col-md-3 themed-grid-col"
                        >fecha de nacimiento
                        <input require 
                            type="date"
                            name="Datos_familiares_Madre_Fecha_Nacimiento"
                            class="form-control m-1"
                        />
                    </label>
                    <label class="col-md-2 themed-grid-col"
                        >nacionalidad
                        <select
                            name="Datos_familiares_Madre_Nacionalidad"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >nivel de instruccion:
                        <select
                            name="Datos_familiares_Madre_Nivel_Instruccion"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >ocupación
                        <input require 
                            type="text"
                            name="Datos_familiares_Madre_Ocupacio"
                            class="form-control m-1"
                        />
                    </label>
                    <label class="col-md-4 themed-grid-col"
                        >teléfono
                        <input require 
                            type="tel"
                            name="Datos_familiares_Madre_Telefono"
                            class="form-control m-1"
                        />
                    </label>

                    <h4 class="text-primary">direccion de habitación</h4>

                    <label class="col-md-4 themed-grid-col"
                        >calle
                        <select
                            name="Datos_familiares_Direccion_Habitacion_Madre_calle"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >sector
                        <select
                            name="Datos_familiares_Direccion_Habitacion_Madre_Sector"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >parroquia
                        <select
                            name="Datos_familiares_Direccion_Habitacion_Madre_parroquia"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <h4 class="text-primary">direccion de trabajo</h4>

                    <label class="col-md-4 themed-grid-col"
                        >calle
                        <select
                            name="Datos_familiares_Direccion_Trabajo_Madre_Calle"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >sector
                        <select
                            name="Datos_familiares_Direccion_Madre_trabajo"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >parroquia
                        <select
                            name="Datos_familiares_Direccion_Trabajo_Madre_Padrerroquia"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <h4 class="text-primary">datos medicos</h4>

                    <label class="col-md-4 themed-grid-col"
                        >condicion medica
                        <select
                            name="Datos_familiares_Madre_Condicion_Medica"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="col-md-5 themed-grid-col"
                        >discapacidad
                        <select
                            name="Datos_familiares_Madre_Discapacidad"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>


                


    </div>
    <div class="tab-pane table-responsive" id="padre" role="tabpanel">

   <h3><u>datos del Padre </u></h3>
                    <label class="col-md-6 themed-grid-col"
                        >Apellidos del padre:
                        <input require 
                            type="text"
                            name="Datos_familiares_Padre_Apellidos"
                            class="form-control m-1"
                        />
                    </label>
                    <label class="col-md-6 themed-grid-col"
                        >nombres del padre:
                        <input require 
                            type="text"
                            name="Datos_familiares_Padre_Nombres"
                            class="form-control m-1"
                        />
                    </label>
                    <label class="col-md-4 themed-grid-col"
                        >C.I:
                        <input require 
                            type="text"
                            name="Datos_familiares_Padre_Cedula"
                            class="form-control m-1"
                        />
                    </label>

                    <label class="col-md-3 themed-grid-col"
                        >fecha de nacimiento
                        <input require 
                            type="date"
                            name="Datos_familiares_Padre_Fecha_Nacimiento"
                            class="form-control m-1"
                            id="fp"
                        />
                    </label>
                    <label class="col-md-4 themed-grid-col"
                        >nacionalidad

                        <select
                            name="Datos_familiares_Padre_Nacionalidad"
                            class="form-control m-1"
                            id="nacionalidad"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >nivel de instruccion:

                        <select
                            name="Datos_familiares_Padre_Nivel_Instruccion"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >ocupación
                        <input require 
                            type="text"
                            name="Datos_familiares_Padre_Ocupacion"
                            class="form-control m-1"
                        />
                    </label>
                    <label class="col-md-4 themed-grid-col"
                        >teléfono
                        <input require 
                            type="number"
                            name="Datos_familiares_Padre_Telefono"
                            class="form-control m-1"
                        />
                    </label>

                    <h4 class="text-primary">direccion de habitación</h4>

                    <label class="col-md-4 themed-grid-col"
                        >calle
                        <select
                            name="Datos_familiares_Direccion_Habitacion_Padre_calle"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >sector
                        <select
                            name="Datos_familiares_Direccion_Habitacion_Padre_Sector"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >parroquia
                        <select
                            name="Datos_familiares_Direccion_Habitacion_Padre_Parroquia"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <h4 class="text-primary">direccion de trabajo</h4>

                    <label class="col-md-4 themed-grid-col"
                        >calle
                        <select
                            name="Datos_familiares_Direccion_Trabajo_Padre_Calle"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >sector
                        <select
                            name="Datos_familiares_Direccion_Trabajo_Padre_Sector"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >parroquia
                        <select
                            name="Datos_familiares_Direccion_Trabajo_Padre_Parroquia"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <h4 class="text-primary">datos medicos</h4>

                    <label class="col-md-4 themed-grid-col"
                        >condicion medica
                        <select
                            name="Datos_familiares_Padre_Condicion_Medica"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >discapacidad

                        <select
                            name="Datos_familiares_Padre_Discapacidad"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>
              
                

    </div>
    <div class="tab-pane table-responsive" id="representante" role="tabpanel">

                    <h3><u>datos del representante </u></h3>
                    <label class="col-md-6 themed-grid-col"
                        >Apellidos del representante:
                        <input require 
                            type="text"
                            name="Datos_familiares_Reprecentante_Apellidos"
                            class="form-control m-1"
                        />
                    </label>
                    <label class="col-md-6 themed-grid-col"
                        >nombres del representante:
                        <input require 
                            type="text"
                            name="Datos_familiares_Reprecentante_Nombres"
                            class="form-control m-1"
                        />
                    </label>
                    <label class="col-md-4 themed-grid-col"
                        >C.I:
                        <input require 
                            type="text"
                            name="Datos_familiares_Reprecentante_Cedula"
                            class="form-control m-1"
                        />
                    </label>

                    <label class="col-md-3 themed-grid-col"
                        >fecha de nacimiento
                        <input require 
                            type="date"
                            name="Datos_familiares_Reprecentante_Fecha_Nacimiento"
                            class="form-control m-1"
                        />
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >nacionalidad
                        <select
                            name="Datos_familiares_Reprecentante_Nacionalidad"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >nivel de instruccion:

                        <select
                            name="Datos_familiares_Reprecentante_Nivel_Instruccion"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >ocupación
                        <input require 
                            type="text"
                            name="Datos_familiares_Reprecentante_Ocpacion"
                            class="form-control m-1"
                        />
                    </label>
                    <label class="col-md-4 themed-grid-col"
                        >teléfono
                        <input require 
                            type="number"
                            name="Datos_familiares_Reprecentante_Telefono"
                            class="form-control m-1"
                        />
                    </label>

                    <h4 class="text-primary">direccion de habitación</h4>

                    <label class="col-md-4 themed-grid-col"
                        >calle
                        <select
                            name="Datos_familiares_Direccion_Habitacion_Reprecentante_Calle"
                            class="form-control m-1"
                        >
                            <?php ?>
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >sector
                        <select
                            name="Datos_familiares_Direccion_Habitacion_Reprecentante_Sector"
                            class="form-control m-1"
                        >
                             
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >parroquia
                        <select
                            name="Datos_familiares_Direccion_Habitacion_Reprecentante_Parroquia"
                            class="form-control m-1"
                        >
                            <?php  ?>
                        </select>
                    </label>

                    <h4 class="text-primary">direccion de trabajo</h4>

                    <label class="col-md-4 themed-grid-col"
                        >calle
                        <select
                            name="Datos_familiares_Direccion_Trabajo_Reprecentante_Calle"
                            class="form-control m-1"
                        >
                            
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >sector
                        <select
                            name="Datos_familiares_Direccion_Trabajo_Reprecentante_Sector"
                            class="form-control m-1"
                        >
                            
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >parroquia
                        <select
                            name="Datos_familiares_Direccion_Trabajo_Reprecentante_Parroquia"
                            class="form-control m-1"
                        >
                            
                        </select>
                    </label>

                    <h4 class="text-primary">datos medicos</h4>

                    <label class="col-md-4 themed-grid-col"
                        >condicion medica
                        <select
                            name="Datos_familiares_Reprecentante_Condicion_Medica"
                            class="form-control m-1"
                        >
                            
                        </select>
                    </label>

                    <label class="col-md-4 themed-grid-col"
                        >discapacidad
                        <select
                            name="Datos_familiares_Reprecentante_Discapacidad"
                            class="form-control m-1"
                        >
                            
                        </select>
                    </label>


    </div>

  </div>

                
                

                    <button
                        type="button"
                        class="btn btn-primary"
                        value="n"
                        name="n"
                        id="guardar"
                    >
                        guardar
                    </button>
                <div id="loader"></div>
            </fieldset>
        </form>


<script src="../Codigo_js/Funciones_js/Registrar_niños.js"></script>




