package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/NEBULA1978/rest-api-postgreSQL/db"
	"github.com/NEBULA1978/rest-api-postgreSQL/models"
	"github.com/NEBULA1978/rest-api-postgreSQL/routes"
	"github.com/gorilla/mux"
	"github.com/joho/godotenv"
)

func main() {

	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// database connection
	db.DBConnection()
	// db.DB.Migrator().DropTable(models.User{})
	db.DB.AutoMigrate(models.Task{})
	db.DB.AutoMigrate(models.User{})

	r := mux.NewRouter()

	// Index route
	r.HandleFunc("/", routes.HomeHandler)

	s := r.PathPrefix("/api").Subrouter()

	// tasks routes
	s.HandleFunc("/tasks", routes.GetTasksHandler).Methods("GET")
	s.HandleFunc("/tasks/{id}", routes.GetTaskHandler).Methods("GET")
	s.HandleFunc("/tasks", routes.CreateTaskHandler).Methods("POST")

	// users routes
	s.HandleFunc("/users", routes.GetUsersHandler).Methods("GET")
	s.HandleFunc("/users/{id}", routes.GetUserHandler).Methods("GET")
	s.HandleFunc("/users", routes.PostUserHandler).Methods("POST")
	s.HandleFunc("/users/{id}", routes.DeleteUserHandler).Methods("DELETE")

	// Inicia el servidor en el puerto 8080
	fmt.Println("Servidor iniciado en http://localhost:8080")
	http.ListenAndServe(":8080", r)
}
