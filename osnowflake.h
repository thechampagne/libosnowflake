#ifndef __OSNOWFLAKE_H__
#define __OSNOWFLAKE_H__

#include <stddef.h>
#include <stdint.h>

typedef struct osf_from_base32_t {
  int64_t id;
  int ok;
} osf_from_base32_t;

typedef enum osf_month_time_t {
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
} osf_month_time_t;

typedef enum osf_weekday_time_t {
	OSF_WEEKDAY_TIME_SUNDAY    = 0, 
	OSF_WEEKDAY_TIME_MONDAY, 
	OSF_WEEKDAY_TIME_TUESDAY, 
	OSF_WEEKDAY_TIME_WEDNESDAY, 
	OSF_WEEKDAY_TIME_THURSDAY, 
	OSF_WEEKDAY_TIME_FRIDAY, 
	OSF_WEEKDAY_TIME_SATURDAY,
} osf_weekday_time_t;

#ifdef __cplusplus
extern "C" {
#endif

extern int64_t osf_generate(int64_t machine_id);

extern uint8_t* osf_base32(int64_t id, size_t* out_len);

extern osf_from_base32_t osf_from_base32(const uint8_t* bs, size_t len);

extern int64_t osf_generation_time(int64_t id);

extern int64_t osf_generation_time_day(int64_t nsec);

extern osf_month_time_t osf_generation_time_month(int64_t nsec);

extern osf_weekday_time_t osf_generation_time_weekday(int64_t nsec);

extern int64_t osf_generation_time_year(int64_t nsec);

#ifdef __cplusplus
}
#endif

#endif // __OSNOWFLAKE_H__
