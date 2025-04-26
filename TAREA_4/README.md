# Laboratorio: Conceptos de SO, Seguridad y Simulación Robótica

Este repositorio contiene los elementos desarrollados como parte de un laboratorio o tarea enfocada en reforzar conceptos de sistemas operativos, seguridad informática y simulación robótica. El proyecto combina el análisis teórico de documentos específicos con el desarrollo práctico de una simulación y su despliegue en contenedores.

## Contenido del Proyecto

El proyecto se divide en las siguientes partes principales:

1.  **Análisis Teórico:**
    * **Interrupciones en Linux:** Resumen y respuestas detalladas a preguntas sobre el manejo de interrupciones y excepciones en el kernel de Linux, basados en el documento "Linux Interrupts: The Basic Concepts" (originalmente `Interrupciones en linux.pdf`).
    * **Bootkits:** Resumen y abstracción de los puntos clave sobre la evolución, técnicas y futuro de los bootkits, basados en el documento "BOOTKITS: PAST, PRESENT & FUTURE" (originalmente `BOOTKITS PAST, PRESENT FUTURE.pdf`).

2.  **Simulación Robótica con PyBullet:**
    * Un script de Python (`robot_sim.py`) que implementa una simulación sencilla de un brazo robótico (Franka Emika Panda) utilizando la librería PyBullet.
    * La simulación carga el modelo del robot, lo sitúa en un entorno básico y controla una de sus articulaciones para realizar un movimiento simple (sinusoidal).

3.  **Despliegue con Docker:**
    * Un `Dockerfile` que permite empaquetar la simulación de PyBullet en un contenedor Docker para facilitar su despliegue y ejecución en diferentes entornos de forma consistente.
    * La configuración está preparada para ejecutar la simulación en modo *headless* (sin interfaz gráfica).

## Instrucciones de Uso

### Simulación PyBullet (`robot_sim.py`)

**Prerrequisitos:**

* Python 3 instalado.
* Librería PyBullet instalada:
    ```bash
    pip install pybullet
    ```

**Ejecución:**

1.  Navega hasta el directorio donde se encuentra el archivo `robot_sim.py`.
2.  Ejecuta el script desde la terminal:
    ```bash
    python robot_sim.py
    ```
3.  **Modo de Ejecución:**
    * Por defecto (`use_gui = True` dentro del script), se abrirá una ventana gráfica mostrando la simulación.
    * Puedes editar el script y cambiar `use_gui = False` para ejecutar la simulación sin interfaz gráfica (modo headless).
4.  Presiona `Ctrl+C` en la terminal para detener la simulación limpiamente.

### Despliegue Docker

**Prerrequisitos:**

* Docker instalado y en ejecución en tu sistema. ([Instrucciones de instalación de Docker](https://docs.docker.com/get-docker/))
* El archivo `Dockerfile` presente en el mismo directorio que `robot_sim.py`.
* Asegúrate de que `robot_sim.py` esté configurado para ejecutarse en modo headless (`use_gui = False`).

**Pasos:**

1.  **Construir la Imagen Docker:**
    * Abre una terminal en el directorio del proyecto (donde están `Dockerfile` y `robot_sim.py`).
    * Ejecuta el comando `build`, reemplazando `<nombre_imagen>` con un nombre descriptivo para tu imagen (ej. `pybullet-lab-sim`):
        ```bash
        docker build -t <nombre_imagen> .
        ```

2.  **Ejecutar el Contenedor:**
    * Una vez construida la imagen, ejecuta un contenedor a partir de ella:
        ```bash
        docker run --rm <nombre_imagen>
        ```
    * La simulación se ejecutará dentro del contenedor (sin interfaz gráfica) y la salida de la consola se mostrará en tu terminal.
    * El flag `--rm` asegura que el contenedor se elimine automáticamente al finalizar la ejecución.

## Documentos de Referencia

El análisis teórico se basó en los siguientes documentos (incluidos o referenciados en el contexto original del laboratorio):

* `Interrupciones en linux.pdf` ("Linux Interrupts: The Basic Concepts" por Mika J. Järvenpää)
* `BOOTKITS PAST, PRESENT FUTURE.pdf` ("BOOTKITS: PAST, PRESENT & FUTURE" por Rodionov, Matrosov, Harley)

*(Opcional: Puedes añadir aquí la lista de referencias generada anteriormente si deseas incluirla directamente en el README)*

---

Este README proporciona una visión general clara, explica cada componente y da instrucciones directas sobre cómo ejecutar las partes prácticas del proyecto.
