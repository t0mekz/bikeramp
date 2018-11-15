# README

**NOTE: This application is using Google Distance Matrix API if you want to run this app you need to provide proper API_KEY first.**

# Stack

- Ruby 2.5.3
- RoR 5.2.1
- PostgreSQL
- Redis
- Sidekiq


# Docker

To build app using docker use command `docker-compose build`
After build you will be able to launch app using command `docker-compose up`
Remember to run `bundle exec` and migrations

# Endpoints

## POST api/v1/trips
### Example request
```
{
	"start_address": "Plac Europejski 2, Warszawa, Polska",
	"destination_address": "Plac Europejski 2, Warszawa, Polska",
	"price": 80,
	"date": "2018-11-15"
}
```

### Response

If params were valid, it should return trip object with `200 Created` code
When errors occurs during creating object it should return json with `errors` key and status code `422 Unprocessable Entity`
```
{
    "errors": {
        "start_address": [
            "can't be blank"
        ],
        "destination_address": [
            "can't be blank"
        ],
        "price": [
            "can't be blank",
            "is not a number"
        ],
        "date": [
            "can't be blank"
        ]
    }
}
```

## GET api/v1/stats/weekly
### Response
```
{
    "total_distance": "363560.0 km",
    "total_price": "1600198.29PLN"
}
```

## GET api/v1/stats/monthly
### Response
```
[
    {
        "day": "November, 14th",
        "total_distance": "251656.0 km",
        "avg_ride": "62914.0 km",
        "avg_price": "2.2PLN"
    },
    {
        "day": "November, 15th",
        "total_distance": "111904.0 km",
        "avg_ride": "37301.33 km",
        "avg_price": "533360.0PLN"
    }
]
```
