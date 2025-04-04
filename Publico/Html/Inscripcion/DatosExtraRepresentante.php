<form
hx-post="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="submit"
hx-target="#InicioInscripcion"
  >
  <label class="col-md-4 themed-grid-col"
>teléfono
<input require
type="tel"
name="numero_telefono"
class="form-control m-1"
/>
</label>
  <div class="mb-3">
    <label for="tipo_telefono" class="form-label">tipo telefono</label>
    <select class="form-select w-75" id="tipo_telefono" name="tipo_telefono" required>
      <option value=""></option>  <!-- Tambah opsi kosong -->
      <option value="fijo">fijo</option>  <!-- Tambah opsi kosong -->
      <option value="celular">celular</option>

    </select>
    <div class="invalid-feedback">Mohon pilih kelas.</div>
  </div>



<button type="submit"
class="btn btn-primary"
name="id_propietario"
value="<?= $id_propietario ?>"
  >
  guarda 
</button>
</form>
