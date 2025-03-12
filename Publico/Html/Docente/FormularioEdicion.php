<form 
hx-post="/Codigo_php/Modulos/Gestionar_Docente.php"
hx-trigger="submit"
hx-target="#tablaDeDocentes"
class="needs-validation container" novalidate>
  <!-- Input nama, dengan validasi -->
  <div class="mb-3">
    <label for="nombre" class="form-label">Nombre</label>
    <input type="text" class="form-control w-75" id="nombre" name="nombre"
    value="<?= $nombres ?>"
    required>
    <div class="invalid-feedback">no es un nombre válido.</div> <!-- Pesan validasi -->
  </div>

  <!-- Input alamat, dengan validasi -->
  <div class="mb-3">
    <label for="apellido" class="form-label">Apellidos</label>
    <input type="text" class="form-control w-75" id="apellido" name="apellido"
    value="<?= $apellidos ?>"
    required>
    <div class="invalid-feedback">ingrese su apellidos.</div>
  </div>

  <!-- Input nomor identitas, dengan validasi -->
  <div class="mb-3">
    <label for="cedula" class="form-label">Cedula</label>
    <input type="number" class="form-control w-75" id="cedula" name="cedula"
    value="<?= $cedula ?>"
    required>
    <div class="invalid-feedback">Mohon isi nomor cedula.</div>
  </div>

  <!-- Input tanggal lahir, dengan validasi -->
  <div class="mb-3">
    <label for="fecha_nacimiento" class="form-label">fecha de nacimiento</label>
    <input type="date" class="form-control w-75" id="fecha_nacimiento" name="fecha_nacimiento"
    value="<?= $fecha_nacimiento ?>"
    required>
    <div class="invalid-feedback">Mohon isi tanggal lahir.</div>
  </div>

  <!-- Input nomor telepon, dengan validasi -->
  <div class="mb-3">
    <label for="telefono" class="form-label">Telefono</label>
    <input type="tel" class="form-control w-75"
    value="<?= $telefono ?>"
    id="telefono" name="telefono" required>
    <div class="invalid-feedback">Mohon isi nomor telepon.</div>
  </div>

  <!-- Input pilihan kelas, dengan validasi -->
  <div class="mb-3">
    <label for="tipo_telefono" class="form-label">tipo telefono</label>
    <select class="form-select w-75" id="tipo_telefono"
    
    name="tipo_telefono" required>
      <option value="<?= $tipo_telefono ?>">no cambiar</option>  <!-- Tambah opsi kosong -->
      <option value="fijo">fijo</option>  <!-- Tambah opsi kosong -->
      <option value="celular">celular</option>

    </select>
    <div class="invalid-feedback">Mohon pilih kelas.</div>
  </div>

  <!-- Tombol submit, dengan validasi  -->
  <button type="submit"
  data-bs-toggle='modal' data-bs-target='#firefoxModal'
      
  class="btn btn-primary" id="editarDocente" name="Editar" value="id_docente">guardar</button>
</form>