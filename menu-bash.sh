#!/bin/bash

PS3="Selecciona una opción: "

while true; do
    options=("Iniciar Contenedor PostgreSQL" "Conectar al Contenedor PostgreSQL" "Crear Base de Datos 'gorm'" "Listar Bases de Datos" "Conectar a la Base de Datos 'gorm'" "Ejecutar Aplicación Go" "Listar Tablas en la Base de Datos 'gorm'" "Salir")

    select opt in "${options[@]}"; do
        case $opt in
            "Iniciar Contenedor PostgreSQL")
                docker run --name some-postgres -e POSTGRES_USER=next -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres
                break
                ;;
            "Conectar al Contenedor PostgreSQL")
                docker exec -it some-postgres bash
                break
                ;;
            "Crear Base de Datos 'gorm'")
                docker exec -it some-postgres psql -U next -c "CREATE DATABASE gorm;"
                break
                ;;
            "Listar Bases de Datos")
                docker exec -it some-postgres psql -U next -c "\l"
                break
                ;;
            "Conectar a la Base de Datos 'gorm'")
                docker exec -it some-postgres psql -U next -d gorm
                break
                ;;
            "Ejecutar Aplicación Go")
                air .
                break
                ;;
            "Listar Tablas en la Base de Datos 'gorm'")
                docker exec -it some-postgres psql -U next -d gorm -c "\d"
                break
                ;;
            "Salir")
                echo "Saliendo del script."
                exit 0
                ;;
            *)
                echo "Opción inválida. Inténtalo de nuevo."
                break
                ;;
        esac
    done
done


**Descripción del Script Bash para PostgreSQL y Go:**

Este script Bash proporciona una interfaz de línea de comandos para realizar diversas operaciones relacionadas con PostgreSQL y una aplicación en Go. A continuación, se presenta una descripción detallada de cada parte del código:

1. **Configuración del Entorno de Selección:**
    - `PS3="Selecciona una opción: "`: Configura el prompt de selección en el bucle `select` para proporcionar un mensaje claro al usuario.

2. **Bucle Principal:**
    - `while true; do`: Inicia un bucle infinito para que el menú permanezca disponible hasta que el usuario decida salir.

3. **Opciones del Menú Principal:**
    - Se define un conjunto de opciones de menú, cada una asociada con una acción específica.

4. **Bucle de Selección (`select`):**
    - `select opt in "${options[@]}"; do`: Presenta las opciones al usuario y permite que el usuario seleccione una.

5. **Casos de Opción (`case`):**
    - Para cada opción seleccionada, se ejecuta un bloque de código correspondiente.

6. **Opciones del Menú y Acciones:**
    - **Iniciar Contenedor PostgreSQL (`"Iniciar Contenedor PostgreSQL"`):** Ejecuta el comando para iniciar un contenedor de PostgreSQL.
    - **Conectar al Contenedor PostgreSQL (`"Conectar al Contenedor PostgreSQL"`):** Conecta al shell del contenedor de PostgreSQL.
    - **Crear Base de Datos 'gorm' (`"Crear Base de Datos 'gorm'"`):** Ejecuta el comando SQL para crear la base de datos 'gorm'.
    - **Listar Bases de Datos (`"Listar Bases de Datos"`):** Muestra la lista de bases de datos en el contenedor de PostgreSQL.
    - **Conectar a la Base de Datos 'gorm' (`"Conectar a la Base de Datos 'gorm'"`):** Conecta al intérprete de comandos `psql` para la base de datos 'gorm'.
    - **Ejecutar Aplicación Go (`"Ejecutar Aplicación Go"`):** Inicia la aplicación Go usando Air para un reinicio automático.
    - **Listar Tablas en la Base de Datos 'gorm' (`"Listar Tablas en la Base de Datos 'gorm'"`):** Muestra las tablas en la base de datos 'gorm'.
    - **Salir (`"Salir"`):** Finaliza el script si el usuario elige salir.

7. **Manejo de Opciones Inválidas:**
    - `*) echo "Opción inválida. Inténtalo de nuevo."`: Proporciona un mensaje de error si el usuario selecciona una opción no válida.

8. **Fin del Bucle Principal:**
    - `done`: Cierra el bucle principal.

9. **Salida del Script:**
    - `exit 0`: Sale del script cuando el usuario elige la opción "Salir".

Este script ofrece una manera interactiva de gestionar contenedores PostgreSQL, bases de datos y ejecutar una aplicación en Go, todo desde la línea de comandos.
