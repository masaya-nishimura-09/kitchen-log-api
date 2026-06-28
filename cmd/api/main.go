package recipe

import (
	"time"
)

type Recipe struct {
	Id          uint
	UserId      uint
	Title       string
	ImageUrl    string
	Description string
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
