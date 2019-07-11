package main

import (
	"fmt"
)

func IsUnique(input string) bool {
	seen := make(map[rune]struct{})
	for _, r := range input {
		if _, ok := seen[r]; ok {
			return false
		} else {
			seen[r] = struct{}{}
		}
	}
	return true
}

func main() {
	fmt.Println(IsUnique(`test`))
	fmt.Println(IsUnique(`tesy`))
}
