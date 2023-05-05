package main

import (
	"fmt"
	"net/http"

	"github.com/NEBULA1978/rest-api-postgreSQL/routes"
	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()

	// Redirige la ruta raíz a la ruta /home
	r.HandleFunc("/", routes.HomeHandler)

	// Inicia el servidor en el puerto 8080
	fmt.Println("Servidor iniciado en http://localhost:8080")
	http.ListenAndServe(":8080", r)
}
