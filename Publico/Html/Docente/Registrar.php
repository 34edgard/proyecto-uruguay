
    
    <!-- Formulir pendaftaran dosen yang di-bootstrap -->
<form method="post" action="Pag_5.php" class="needs-validation container" novalidate>
  <!-- Input nama, dengan validasi -->
  <div class="mb-3">
    <label for="nombre" class="form-label">Nombre</label>
    <input type="text" class="form-control w-75" id="nombre" name="nombre" required>
    <div class="invalid-feedback">no es un nombre válido.</div> <!-- Pesan validasi -->
  </div>

  <!-- Input alamat, dengan validasi -->
  <div class="mb-3">
    <label for="apellido" class="form-label">Apellidos</label>
    <input type="text" class="form-control w-75" id="apellido" name="apellido" required>
    <div class="invalid-feedback">ingrese su apellidos.</div>
  </div>

  <!-- Input nomor identitas, dengan validasi -->
  <div class="mb-3">
    <label for="cedula" class="form-label">Cedula</label>
    <input type="number" class="form-control w-75" id="cedula" name="cedula" required>
    <div class="invalid-feedback">Mohon isi nomor cedula.</div>
  </div>

  <!-- Input tanggal lahir, dengan validasi -->
  <div class="mb-3">
    <label for="fecha_nacimiento" class="form-label">fecha de nacimiento</label>
    <input type="date" class="form-control w-75" id="fecha_nacimiento" name="fecha_nacimiento" required>
    <div class="invalid-feedback">Mohon isi tanggal lahir.</div>
  </div>

  <!-- Input nomor telepon, dengan validasi -->
  <div class="mb-3">
    <label for="telefono" class="form-label">Telefono</label>
    <input type="tel" class="form-control w-75" id="telefono" name="telefono" required>
    <div class="invalid-feedback">Mohon isi nomor telepon.</div>
  </div>

  <!-- Input pilihan kelas, dengan validasi -->
  <div class="mb-3">
    <label for="aula" class="form-label">aula</label>
    <select class="form-select w-75" id="aula" name="aula" required>
      <option value="">P</option>  <!-- Tambah opsi kosong -->
      <option value="1">Kelas 1</option>
      <option value="2">Kelas 2</option>
      <option value="3">Kelas 3</option>
    </select>
    <div class="invalid-feedback">Mohon pilih kelas.</div>
  </div>

  <!-- Tombol submit, dengan validasi  -->
  <button type="button" class="btn btn-primary" id="crearDocente" name="formulario" value="crear">Daftar</button>
</form>
<div id="mensaje"></div>

<!-- JavaScript untuk validasi -->
<script>
  //Pilih semua elemen formulir
  (function () {
    'use strict';
    var forms = document.querySelectorAll('.needs-validation');
    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
          if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
  })();
</script>
    
    
    <script src="/Codigo_js/Funciones/CrearDocente.js"></script>