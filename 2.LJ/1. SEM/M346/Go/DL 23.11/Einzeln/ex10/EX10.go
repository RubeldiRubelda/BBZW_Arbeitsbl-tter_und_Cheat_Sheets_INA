package main

import "fmt"

func main() {
	var users = []string{"alice", "bob", "charlene", "dan", "erica", "freddy"}
	var servers = []string{"web", "db", "proxy", "backup"}

	total := len(users) * len(servers)
	needed := make([]string, 0, total)

	for _, u := range users {
		for _, s := range servers {
			hostname := fmt.Sprintf("%s_%s", u, s)
			needed = append(needed, hostname)
			fmt.Printf("len: %2d, cap: %2d | %s\n", len(needed), cap(needed), hostname)
		}
	}
	fmt.Printf("needed %d servers: %v\n", len(needed), needed)
}