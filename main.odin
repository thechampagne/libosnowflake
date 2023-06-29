package snowflake

import "core:c"
import "core:time"

osf_from_base32_t :: struct {
    id: c.int64_t,
    ok: c.int,
}

osf_month_time_t :: enum c.int {
	OSF_MONTH_TIME_JANUARY   = 1, 
	OSF_MONTH_TIME_FEBRUARY, 
	OSF_MONTH_TIME_MARCH, 
	OSF_MONTH_TIME_APRIL, 
	OSF_MONTH_TIME_MAY, 
	OSF_MONTH_TIME_JUNE, 
	OSF_MONTH_TIME_JULY, 
	OSF_MONTH_TIME_AUGUST, 
	OSF_MONTH_TIME_SEPTEMBER, 
	OSF_MONTH_TIME_OCTOBER, 
	OSF_MONTH_TIME_NOVEMBER, 
	OSF_MONTH_TIME_DECEMBER, 
}

osf_weekday_time_t :: enum c.int {
	OSF_WEEKDAY_TIME_SUNDAY    = 0, 
	OSF_WEEKDAY_TIME_MONDAY, 
	OSF_WEEKDAY_TIME_TUESDAY, 
	OSF_WEEKDAY_TIME_WEDNESDAY, 
	OSF_WEEKDAY_TIME_THURSDAY, 
	OSF_WEEKDAY_TIME_FRIDAY, 
	OSF_WEEKDAY_TIME_SATURDAY,
}



@export osf_generate :: proc(machine_id: c.int64_t) -> c.int64_t {
    return generate(machine_id)
}

@export osf_base32 :: proc(id: c.int64_t, out_len: ^c.size_t) -> [^]byte {
    i := base32(id)
    out_len^ = len(i)
    return raw_data(i)
}


@export osf_from_base32 :: proc(bs: [^]byte, len: c.size_t) -> osf_from_base32_t {
    id, ok := from_base32(bs[:len])
    if ok {
	return osf_from_base32_t {
	    id,
	    1
	}
    }
    return osf_from_base32_t {
	id,
	0
    }
}

@export osf_generation_time :: proc(id: c.int64_t) -> c.int64_t {
    return generation_time(id)._nsec
}

@export osf_generation_time_day :: proc(nsec: c.int64_t) -> c.int64_t {
    t := time.Time{nsec}
    return c.int64_t(time.day(t))
}

@export osf_generation_time_month :: proc(nsec: c.int64_t) -> osf_month_time_t {
    t := time.Time{nsec}
    return osf_month_time_t(time.month(t))
}

@export osf_generation_time_weekday :: proc(nsec: c.int64_t) -> osf_weekday_time_t {
    t := time.Time{nsec}
    return osf_weekday_time_t(time.weekday(t))
}

@export osf_generation_time_year :: proc(nsec: c.int64_t) -> c.int64_t {
    t := time.Time{nsec}
    return c.int64_t(time.year(t))
}
