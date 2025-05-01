# Usa Fedora como imagen base
FROM fedora:latest

# Actualiza los repositorios e instala las herramientas necesarias
RUN dnf -y update && \
    dnf -y install \
    htop \
    net-tools \
    iputils \
    python3 \
    git && \
    dnf clean all

# Establece el directorio de trabajo
WORKDIR /root

# Comando predeterminado para cuando el contenedor arranque
CMD ["bash"]
