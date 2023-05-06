package main

import (
	"fmt"
	"net/http"

	"github.com/NEBULA1978/rest-api-postgreSQL/db"
	"github.com/NEBULA1978/rest-api-postgreSQL/models"
	"github.com/NEBULA1978/rest-api-postgreSQL/routes"
	"github.com/gorilla/mux"
)

func main() {

	db.DBConnection()
	// db.DB.Migrator().DropTable(models.User{})
	db.DB.AutoMigrate(models.Task{})
	db.DB.AutoMigrate(models.User{})
	r := mux.NewRouter()

	r.HandleFunc("/", routes.HomeHandler)

	// users routes
	r.HandleFunc("/users", routes.GetUsersHandler).Methods("GET")

	r.HandleFunc("/users/{id}", routes.GetUserHandler).Methods("GET")

	r.HandleFunc("/users", routes.PostUserHandler).Methods("POST")

	r.HandleFunc("/users/{id}", routes.DeleteUserHandler).Methods("DELETE")

	// Inicia el servidor en el puerto 8080
	fmt.Println("Servidor iniciado en http://localhost:8080")
	http.ListenAndServe(":8080", r)
}
