class HttpRequester {
  constructor() {
    // No se necesita configuración adicional por defecto.
  }

  async request(url, options = {}) {
    const defaultOptions = {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
    };

    const mergedOptions = { ...defaultOptions, ...options };

    try {
      const response = await fetch(url, mergedOptions);

      if (!response.ok) {
        const errorData = await response.json().catch(() => ({ message: response.statusText })); // Intenta obtener JSON del error, si falla usa el statusText
        throw new Error(`HTTP error! status: ${response.status}, message: ${errorData.message || response.statusText}`);
      }

      const contentType = response.headers.get('content-type');
      if (contentType && contentType.includes('application/json')) {
        return await response.json();
      } else if (contentType && contentType.includes('text/plain')){
        return await response.text();
      } else {
        // Manejar otros tipos de contenido si es necesario.  Por ejemplo, para imágenes:
        // return await response.blob();
        return await response.text(); // Retorna como texto por defecto si no es JSON
      }

    } catch (error) {
      console.error('Error en la petición HTTP:', error);
      throw error; // Re-lanza el error para que sea manejado por el llamante.
    }
  }


  async get(url, headers = {}) {
    return this.request(url, { headers });
  }

  async post(url, data, headers = {}) {
    return this.request(url, {
      method: 'POST',
      headers: { ...headers, 'Content-Type': 'application/json' },
      body: JSON.stringify(data),
    });
  }

  async put(url, data, headers = {}) {
    return this.request(url, {
      method: 'PUT',
      headers: { ...headers, 'Content-Type': 'application/json' },
      body: JSON.stringify(data),
    });
  }

  async delete(url, headers = {}) {
    return this.request(url, { method: 'DELETE', headers });
  }
}


// Ejemplo de uso:

const http = new HttpRequester();

async function fetchData() {
  try {
    const data = await http.get('https://jsonplaceholder.typicode.com/todos/1');
    console.log('GET:', data);

    const newData = { userId: 1, title: 'Nuevo título', completed: false };
    const postData = await http.post('https://jsonplaceholder.typicode.com/todos', newData);
    console.log('POST:', postData);

    const updatedData = { userId: 1, title: 'Título actualizado', completed: true };
    const putData = await http.put('https://jsonplaceholder.typicode.com/todos/1', updatedData);
    console.log('PUT:', putData);

    const deleteData = await http.delete('https://jsonplaceholder.typicode.com/todos/1');
    console.log('DELETE:', deleteData); //  DELETE no devuelve datos en este endpoint

  } catch (error) {
    console.error("Error:", error);
  }
}

fetchData();
