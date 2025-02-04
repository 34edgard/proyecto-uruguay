const Registrar_niños = ()=> {
  let i = 0;
  let loader = document.getElementById('loader');
  let datos = new FormData();
  while (i < document.forms.item(0).length) {
    if (document.forms.item(0)[i].name == "") {
      i++;
      continue;
    }

    datos.append(document.forms.item(0)[i].name, document.forms.item(0)[i].value);


    i++;
  }
loader.innerHTML = `<div class="spinner-border text-primary" role="status">
  <span class="visually-hidden">Loading...</span>
  </div>`;
  fetch('/Codigo_php/Modulos/Gestion_Inscripcion_Estudiante.php', {
    method: "POST",
    body: datos
  })
  .then(res => res.text())
  .then(data => {
    loader.innerHTML = data;
    //alert(data);
    //	navigation.navigate('Pag_3.2.php');

  })
  .catch(err => alert(err));
};

const prueba=()=>{
  
  let datap = new FormData();
  let ob = {};
  ob.f = "ph";
  ob.l = "pggh";
  datap.append('dato',[1,2, 2]);
  datap.append('text',"hola");
  datap.append('objeto',ob);
  
  fetch('/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php')
  .then(res=>res.text())
  .then(res=>loader.innerHTML = res)
  .catch(err=>alert(err));
};
prueba();