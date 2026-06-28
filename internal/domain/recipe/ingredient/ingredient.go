package ingredient

import (
	"time"
)

type Ingredient struct {
	Id              uint
	RecipeId        uint
	UserId          uint
	Name            string
	Amount          uint
	MeasurementUnit string
	OrderIndex      uint
	CreatedAt       time.Time
	UpdatedAt       time.Time
}
