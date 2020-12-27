#https://www.cnblogs.com/f-ck-need-u/p/10020951.html
package main

import (
	"fmt"
	"net/http"
)

type MyHandler struct{}

func (wh *MyHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World!\n")
}

func log(h http.Handler) http.Handler {
	count := 0
	f := func(w http.ResponseWriter, r *http.Request) {
		count++
		fmt.Printf("Handler Function called %d times\n", count)
		h.ServeHTTP(w, r)
	}
	return http.HandlerFunc(f)
}

func main() {
	myHandler := MyHandler{}
	server := http.Server{
		Addr: "127.0.0.1:8080",
	}
	http.Handle("/hello", log(&myHandler))
	server.ListenAndServe()