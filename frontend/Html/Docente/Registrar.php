<form
  hx-post="/docente/registrar"
  hx-trigger="submit"
  hx-target="#modal-form"
  class="needs-validation container p-4 border rounded shadow-sm mt-5"
  novalidate
>
  <h1 class="text-center text-primary mb-4">Ingrese los Datos del Docente</h1>

  <div class="row mb-3">
    <div class="col-md-6">
      <label for="nombre" class="form-label">Nombre</label>
      <input
        type="text"
        class="form-control"
        id="nombre"
        name="nombre"
        placeholder="Nombre"
        required
      >
      <div class="invalid-feedback">Por favor, ingrese un nombre válido.</div>
    </div>
    <div class="col-md-6">
      <label for="apellido" class="form-label">Apellido</label>
      <input
        type="text"
        class="form-control"
        id="apellido"
        name="apellido"
        placeholder="Apellido"
        required
      >
      <div class="invalid-feedback">Por favor, ingrese el apellido.</div>
    </div>
  </div>

  <div class="row mb-3">
    <div class="col-md-6">
      <label for="cedula" class="form-label">Cédula</label>
      <input
        type="number"
        class="form-control"
        id="cedula"
        name="cedula"
        placeholder="Cédula"
        required
      >
      <div class="invalid-feedback">Por favor, ingrese el número de cédula.</div>
    </div>
    <div class="col-md-6">
      <label for="fecha_nacimiento" class="form-label">Fecha de Nacimiento</label>
      <input
        type="date"
        class="form-control"
        id="fecha_nacimiento"
        name="fecha_nacimiento"
        required
      >
      <div class="invalid-feedback">Por favor, ingrese la fecha de nacimiento.</div>
    </div>
  </div>

  <div class="row mb-4">
    <div class="col-md-6">
      <label for="telefono" class="form-label">Teléfono</label>
      <input
        type="tel"
        class="form-control"
        id="telefono"
        name="telefono"
        placeholder="Número de teléfono"
        required
      >
      <div class="invalid-feedback">Por favor, ingrese un número de teléfono.</div>
    </div>
    <div class="col-md-6">
      <label for="tipo_telefono" class="form-label">Tipo de Teléfono</label>
      <select class="form-select" id="tipo_telefono" name="tipo_telefono" required>
        <option value="" disabled selected>Seleccione el tipo</option>
        <option value="fijo">Fijo</option>
        <option value="celular">Celular</option>
      </select>
      <div class="invalid-feedback">Por favor, seleccione el tipo de teléfono.</div>
    </div>
  </div>

  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
    <button
      type="submit"
      class="btn btn-primary"
      id="crearDocente"
      data-bs-toggle="modal"
      data-bs-target="#firefoxModal"
      name="formulario"
      value="id_docente"
    >
      Registrar
    </button>
  </div>
</form>

<div class="modal fade" id="firefoxModal" tabindex="-1" aria-labelledby="firefoxModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body" id="modal-form">
        </div>
    </div>
  </div>
</div>