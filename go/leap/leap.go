package leap

import (
	"math"
)

const testVersion = 3

func IsLeapYear(year int) bool {
	floatYear := float64(year)
	if math.Mod(floatYear, 4) == 0 && (math.Mod(floatYear, 400) == 0 || math.Mod(floatYear, 100) != 0) {
		return true
	}

	return false
}
