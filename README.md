# Proyecto Segundo Corte: Entorno Híbrido de Pruebas y Monitoreo

## Resumen Breve

Este proyecto implementa un entorno de pruebas híbrido utilizando máquinas virtuales gestionadas por QEMU/KVM y contenedores Docker. El objetivo principal es explorar diferentes sistemas operativos Linux, realizar análisis específicos de sistema/red en cada uno, y finalmente, desplegar una pila de monitoreo centralizada usando Prometheus, Grafana y Zabbix para observar el estado del entorno completo.

## Arquitectura Propuesta

A continuación se muestra un diagrama de la arquitectura implementada, incluyendo las máquinas virtuales, los contenedores, las redes principales y el stack de monitoreo:

![Arquitectura del Sistema](arquitectura.png)
*_(**Nota Importante:** Debes crear tu propio diagrama de arquitectura (puedes usar una herramienta online como diagrams.net, Excalidraw, o incluso PowerPoint/Paint y exportar como PNG). Guarda la imagen como `arquitectura.png` (o el nombre que prefieras) en tu repositorio GitHub y asegúrate de que la ruta en la línea anterior coincida. El diagrama debe mostrar el Host, las 3 VMs conectadas al bridge `br0`, los 3(+1) contenedores conectados a `red-monitoreo`, y cómo se conectan al stack de monitoreo)._*

## Componentes del Entorno

El entorno está compuesto por:

**1. Máquina Host:**
   * Sistema Operativo: [Indica tu SO Host, ej: Ubuntu 24.04]
   * Software Clave: QEMU/KVM, Docker, Docker Compose, Libvirt (si aplica).
   * Red Bridge Host: `br0` (IP: `192.168.100.1/24`)

**2. Máquinas Virtuales (QEMU en `br0`)**
   * **Rocky Linux:** (IP: `192.168.100.10`) - Enfocada en análisis de servicios y procesos (`glances`, `bpytop`, `journalctl`).
   * **Manjaro Linux:** (IP: `192.168.100.11`) - Enfocada en análisis de red (`wireshark`, `iftop`, `nethogs`).
   * **Arch Linux:** (IP: `192.168.100.12`) - Enfocada en análisis de archivos/discos (`ncdu`, `tree`, etc.) y donde se configuró `node_exporter`.

**3. Contenedores Base (Docker en `red-monitoreo`)**
   * **"Garuda-like" (Base Arch):** (IP: `192.168.100.130`) - Análisis de hardware/dispositivos (`lshw`, `inxi`, `lsblk`).
   * **Alpine Linux:** (IP: `192.168.100.129`) - Análisis con `netdata`.
   * **Debian:** (IP: `192.168.100.131`) - Análisis de logs (`lnav`, `goaccess`).

**4. Contenedor Central (Docker en `--network host` o `red-monitoreo`)**
   * **Fedora (`central-analytics`):** Contiene herramientas de análisis (`nmap`, `htop`, `ping`, `python3`, `git`, `tcpdump`). Usado para análisis centralizado (Actividad 4).

**5. Stack de Monitoreo (Docker Compose en `red-monitoreo`)**
   * **Prometheus:** Recolección de métricas (Puerto 9090).
   * **Grafana:** Visualización de métricas (Puerto 3000).
   * **Zabbix (Server/Web/DB):** Monitoreo adicional y alertas (Puertos 10051, 8080).
   * **Agentes:** Node Exporter y Zabbix Agent instalados en VMs y contenedores.

## Notas y Desafíos

Durante la implementación se encontraron y resolvieron diversos desafíos técnicos:

* **Conflictos de Red:** Se identificaron y corrigieron conflictos iniciales de direcciones MAC/IP duplicadas entre VMs.
* **Discrepancia de Subred:** Se solucionó un problema donde las VMs obtenían IPs de una red diferente a la configurada en el bridge del host, mediante la configuración de IPs estáticas.
* **Instalación de Paquetes:** Se requirió habilitar el repositorio EPEL en Rocky Linux y se encontraron inconsistencias en los mirrors para algunos paquetes (`bpytop`, `prometheus-node-exporter`), necesitando soluciones alternativas (descarga manual de RPM). Se identificaron nombres correctos de paquetes/servicios en diferentes distribuciones (`node_exporter.service`, `prometheus-node-exporter`).
* **Configuración de Servicios:** Se necesitó ajustar la configuración de la base de datos MySQL para Zabbix (UTF-8), configurar correctamente las variables de entorno en `docker-compose.yml` y resolver errores de validación YAML (indentación). Se configuraron los agentes Zabbix para comunicarse correctamente con el servidor Zabbix (usando la IP del host para VMs y el nombre del servicio para contenedores).
* **Troubleshooting Systemd:** Se diagnosticó y resolvió un problema al iniciar `node_exporter` en Arch/Manjaro relacionado con la ruta incorrecta del ejecutable en el archivo de servicio systemd creado manualmente.

## Ejecución (Opcional)

*(Puedes añadir aquí comandos básicos si quieres, como construir la imagen central o levantar el stack de monitoreo)*

```bash
# Ejemplo: Construir imagen central (desde el directorio con el Dockerfile)
# docker build -t central-analytics .

# Ejemplo: Levantar stack de monitoreo (desde el directorio con docker-compose.yml)
# docker compose up -d
