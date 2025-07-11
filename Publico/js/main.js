!(function () {
  "use strict";

  let butonContenedor = document.createElement('div');

  const styles = document.createElement('style');
  styles.innerHTML = `

  .round-button {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
  position: fixed;
  bottom: 140px;
  right: 11px;
  display: flex;
  justify-content: center;
  align-items: center;
  transition: all 0.3s ease;
  }

  .round-button:hover {
  background-color: #0069d9;
  }

  .round-button.square {
  border-radius: 5px;
  width: 300px;
  height: 400px;
  }

  .chatbox {
  position: fixed;
  bottom: 180px;
  right: 11px;
  background-color: white;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
  display: none;
  box-shadow: 2px 2px 5px rgba(0,0,0,0.1);
  }

  .chatbox.show {
  display: block;
  }

  .chat-messages {
  height: 300px;
  overflow-y: auto;
  padding-bottom: 10px;
  }

  .chat-messages  div{
  min-width: 80%;
  padding: 1rem;
  border-radius: 8px;
  margin-bottom: 5px;
  color: #eee;
  }

  #userInput {
  width: calc(100% - 70px);
  padding: 5px;
  color:#000;
  margin-right: 5px;
  border: 1px solid #555;
  border-radius: 8px;
  }
  #userInput:hover{
  outline-color: #007bff;
  }

  #sendButton {
  padding: 5px 10px;
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
  border-radius: 8px;
  }

  .message-user{

  background: #007b9f;

  }
  .message-bot{

  background: #070;
  }

  `;


  butonContenedor.classList.add("container");
  butonContenedor.classList.add("draggable-btn");
  butonContenedor.innerHTML = ` <button id="chatButton" class="round-button">
  <i class="fas fa-comment"></i>  <!-- Font Awesome icon - you'll need to include it -->
  </button>
  <div id="chatbox" class="chatbox">
  <!-- Chatbot content will go here -->
  <div class="chat-messages">
  </div>
  <input type="text" id="userInput" placeholder="Type your message...">
  <button id="sendButton">Send</button>
  </div>`;
  document.querySelector('body').appendChild(butonContenedor);
  document.querySelector('body').appendChild(styles);



  const apiKey = "AIzaSyDykleGESQ0IG5Lz6QHXuXN4Olzi5sXRvE";
  let memoria = [];
  const chatButton = document.getElementById('chatButton');
  const chatbox = document.getElementById('chatbox');
  const userInput = document.getElementById('userInput');
  const sendButton = document.getElementById('sendButton');
  const chatMessages = document.querySelector('.chat-messages');
  const contexto = '';

  chatButton.addEventListener('click', () => {
    chatButton.classList.toggle('square');
    chatbox.classList.toggle('show');
  });

  sendButton.addEventListener('click', () => {
    const message = userInput.value;
    if (message.trim() !== '') {
      // Add user message to chat

      memoria.push(`user: ${message}`);
      addChatMessage('user', message);

      userInput.value = '';
      //alert(JSON.stringify(memoria))
      // Placeholder for chatbot response - REPLACE THIS!
      fetch('https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=' + apiKey, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          "contents": [{
            "parts": [{
              "text": contexto + JSON.stringify(memoria)
            }]
          }]
        })
      })
      .then(response => response.json())
      .then(data => {
        //    console.log(data)
        const botResponse = data.candidates[0].content.parts[0].text; // candidates Extract the bot's response
        memoria.push(`bot: ${botResponse}`);
        addChatMessage('bot', botResponse);

      })
      .catch(error => {
        addChatMessage("Error:", "An error occurred. Please try again later.");
        console.error("Error:", error);
      });





    }
  });

  function addChatMessage(sender,
    message) {
    const messageElement = document.createElement('div');
    messageElement.classList.add("message-"+sender);
    message = reemplazarSimboloConEtiquetas(message,
      '*',
      '<small>',
      '</small>');


    messageElement.innerHTML = `${sender}: ${message}`;
    chatMessages.appendChild(messageElement);
    // alert(chatMessages.innerHTML)
    chatMessages.scrollTop = chatMessages.scrollHeight; // Auto-scroll to bottom
  }

  //let message = "Este es un mensaje con *asteriscos*.";





  function reemplazarSimboloConEtiquetas(texto,
    simbolo,
    etiquetaApertura,
    etiquetaCierre) {
    let contador = 0;
    let nuevoTexto = "";
    let indice = texto.indexOf(simbolo);


    while (indice !== -1) {
      contador++;
      if (contador % 2 !== 0) {
        // Si es impar (primera, tercera, etc. ocurrencia)
        nuevoTexto += texto.substring(0, indice) + etiquetaApertura;

      } else {
        // Si es par (segunda, cuarta, etc. ocurrencia)
        nuevoTexto += texto.substring(0, indice) + etiquetaCierre;

      }
      texto = texto.substring(indice + simbolo.length);
      indice = texto.indexOf(simbolo);
    }
    nuevoTexto += texto; // Agregar el resto del texto después de la última ocurrencia del símbolo

    return nuevoTexto;
  }


  

  chatButton.addEventListener('drag',e => {
    butonContenedor.style.top = e.clientY+'px';
    butonContenedor.style.left = e.clientX + 'px';
  });

})();