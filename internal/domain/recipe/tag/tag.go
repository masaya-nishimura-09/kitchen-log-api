package tag

import (
	"time"
)

type Tag struct {
	Id        uint
	RecipeId  uint
	UserId    uint
	Name      string
	CreatedAt time.Time
	UpdatedAt time.Time
}
