package routes

import (
	"fmt"
	"net/http"
)

func HomeHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Se accedió a la ruta /home")
	w.Write([]byte("Hello World 2!"))
}
