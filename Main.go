package main

import (
	"encoding/json"
	"log"
	"net/http"
)

type Item struct {
	ID    string `json:"id"`
	Name  string `json:"name"`
	Price int    `json:"price"`
}

var items = []Item{
	{ID: "1", Name: "Laptop", Price: 1000},
	{ID: "2", Name: "Phone", Price: 500},
}

func getItems(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(items)
}

func addItem(w http.ResponseWriter, r *http.Request) {
	var newItem Item
	json.NewDecoder(r.Body).Decode(&newItem)
	items = append(items, newItem)
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(newItem)
}

func main() {
	http.HandleFunc("/items", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == http.MethodGet {
			getItems(w, r)
		} else if r.Method == http.MethodPost {
			addItem(w, r)
		} else {
			w.WriteHeader(http.StatusMethodNotAllowed)
		}
	})

	log.Println("Starting server on :8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
