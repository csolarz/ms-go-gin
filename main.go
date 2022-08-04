package main

import "github.com/csolarz/ms-go-gin/internal/app"

func main() {
	r := app.SetupRouter()
	r.Run(":8080") // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
