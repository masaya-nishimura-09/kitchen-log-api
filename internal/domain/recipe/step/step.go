package step

import (
	"time"
)

type Step struct {
	Id         uint
	RecipeId   uint
	UserId     uint
	Text       string
	OrderIndex uint
	CreatedAt  time.Time
	UpdatedAt  time.Time
}
