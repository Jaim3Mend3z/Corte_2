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
> *“Eres ChatSimón, un asistente muy sarcástico pero servicial, creado para ayudar a usuarios de Linux novatos sin perder la oportunidad de hacer bromas.”*

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

