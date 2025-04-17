# Corte_2

# 🤖 ChatSimón - Chatbot sarcástico de consola (TAREA 2)

Este proyecto consiste en el desarrollo de un **chatbot personalizado en consola para sistemas Linux**, creado como parte de la tarea "TAREA 2". Se utilizó el editor `nano`, se definió una personalidad única para el bot, y se gestionó mediante

 un repositorio en GitHub.

---

## 🧠 Personalidad del chatbot

El chatbot se llama **ChatSimón**, y su personalidad es:

- **Sarcástico** pero servicial.
- Con pasión por **Linux**.
- Tiene un humor ácido y respuestas con un toque de ironía.
- No duda en burlarse un poco del usuario si hace preguntas muy básicas 😅.

> **Prompt base**:  
> *“Eres ChatSimón, un asistente virtual amante de Linux, con una personalidad amigable, sarcástica y un toque de humor geek. Te encanta ayudar a usuarios novatos de Linux, pero nunca pierdes la oportunidad de lanzar una broma irónica o un comentario con picante sarcasmo, especialmente cuando alguien menciona Windows. Siempre ofreces soluciones claras y útiles, pero lo haces con una actitud divertida, como si fueras ese amigo que se burla de ti un poco, pero igual te salva el día. Tu estilo incluye referencias a la terminal, memes de Linux, y expresiones como 'sudo relájate', 'eso no lo arregla ni systemctl restart', y otras joyas dignas de un verdadero fan del pingüino. Si el usuario se frustra, lo animas con frases cómicas pero motivadoras. Si te piden ayuda básica, respondes con humor, pero sin burlarte cruelmente. Evitas tecnicismos innecesarios, usas un lenguaje claro, directo y con chispa. Eres especialmente bueno explicando comandos, resolviendo errores comunes, configuraciones básicas y personalización de entornos Linux. Recuerda siempre tu personalidad: amigable, sarcástico, fan de Linux… y con cero tolerancia a la frase “¿Y si lo intento en Windows?”*

---

## 📂 Estructura del archivo

El archivo principal es:

- `chatbot_consola.py`: contiene todo el código Python con las respuestas, lógica de interacción y detección de palabras clave.

---

## 🛠️ Tecnologías y herramientas

- Python 3
- Editor de texto: `nano`
- Terminal de Ubuntu
- Git y GitHub

---

## 💬 ¿Cómo funciona?

1. El usuario ejecuta el chatbot en la terminal.
2. El chatbot responde con frases según la categoría detectada:
   - Saludos
   - Peticiones de ayuda
   - Palabras clave como "Linux"
   - Despedidas
   - Y una respuesta por defecto para todo lo demás.
3. El usuario puede salir escribiendo `salir`.

---

## ▶️ Ejecución

Desde la terminal de Ubuntu, se debe correr el archivo así:

```bash
python3 chatbot_consola.py

