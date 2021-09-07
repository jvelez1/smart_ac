### Requirements:
- Docker installed

### Running the project

This will create initial data the first time.
In the root of this project:
1. Build the images
```
docker-compose build
```
2. Run the images
```
docker-compose up
```

# Api Docs:

endpoint:
> http://localhost:4567/devices

body:

```Json
{
  "devices": {
    "serial": "123436gsdfsdf",
    "secret": "asdasdgggf",
    "firmware_version": "v.0.01",
    "registration_date": "2007-11-19"
  }
}
```

response 200

```Json
  "data": {
    "id": "61375ff831d5a60012ff1e94",
    "type": "device",
    "attributes": {
      "serial": "4",
      "firmware_version": "v.0.01",
      "registration_date": "2007-11-19",
      "created_at": "2021-09-07T12:50:00.580+00:00",
      "token": "eyJhbGciOiJub25lIn0.eyJzZXJpYWwiOiI0Iiwic2VjcmV0IjoiZ2dnIn0."
    }
  }
}
```

response 422

```Json
{
  "serial": [
    "is already taken"
  ]
}
```

endpoint:
> http://localhost:4567/device_events

headers:

```
  DEVICE_TOKEN=3060b8a2adf0c294b1f0157030278a9f
```
(this token should belongs to an existing device)

body:

```Json
{
  "device_events": [
    {
      "type": "CARBON_MONOXIDE",
      "value": 11,
      "measurement": "PPM",
      "event_time": "2021-09-03T13:05:47+02:00",
      "status": "OK"
    },
    {
      "type": "AIR_HUMIDITY",
      "value": 34,
      "measurement": "celsius",
      "event_time": "2021-09-03T13:05:47+02:00",
      "status": "not ok!"
    }
  ]
}
```

response 200

```Json
{
  "data": [
    {
      "id": "613762e1f5ce0e00136aeda2",
      "type": "device_event",
      "attributes": {
        "type": "CARBON_MONOXIDE",
        "value": 11,
        "measurement": "PPM",
        "event_time": "2021-09-03T11:05:47.000+00:00",
        "status": "OK",
        "errors": {},
        "saved": true
      }
    },
    {
      "id": "613762e1f5ce0e00136aeda3",
      "type": "device_event",
      "attributes": {
        "type": "AIR_HUMIDITY",
        "value": 34,
        "measurement": "celsius",
        "event_time": "2021-09-03T11:05:47.000+00:00",
        "status": "not ok!",
        "errors": {},
        "saved": true
      }
    }
  ]
}
```

response 404

```Json
{
  "error": "Device not found"
}
```

# Frontend Docs:

Credentials:

```
email: admin@smartac.com
password: 123456789
```

In the admin side you will find:

1. Chats that load every 10 sec.
2. Notifcation that loads every 5 sec.
3. Device listing.
4. Logout
