package main

import (
	"fmt"
	"http"
  "os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World from Google Go!")
}

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(os.Args[1], nil)
}
