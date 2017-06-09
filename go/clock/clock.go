package clock

import (
	"fmt"
	"math"
)

const testVersion = 4

type Clock struct {
	hour, minute int
}

func New(hour, minute int) Clock {
	hour = (hour + int(minute/60)) % 24
	minute = minute % 60

	if minute < 0 {
		minute = (60 + minute) % 60
		hour -= 1
	}

	if hour < 0 {
		hour = (24 + hour) % 24
	}

	return Clock{hour, minute}
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.hour, c.minute)
}

func (c Clock) Add(minutes int) Clock {
	return New(c.hour, c.minute+minutes)
}
