# README

Clone this repository on a local environment running Ruby.

This project is based on Ruby 2.6.3, so it is better to run with that version.
If you do not have this version, you may try to update the file `.ruby-version`. 

The project is based on SQlite, as a result you do not need to install any SQL server. There is no configuration needed.

# Part 1

### 1. Simple API

Write an API to list, show, create, update and delete drivers. Use the standard CRUD verbs for each action.

URLs should look like `/drivers` for collection routes and `/drivers/123` for member routes (e.g. with an ID of `123`).

| Action | Request body | Response body | Status code |
|---|---|---|---|
| Create | JSON object with attributes `first_name`, `last_name`, `phone_number` | JSON object with attributes `id`, `first_name`, `last_name`, `phone_number` | `201 Created` |
| Show | - | Same as Create |  `200 OK` |
| Edit | JSON object with any of `first_name`, `last_name`, `phone_number` | Same as Create | `200 OK` |
| Delete | - | - | `204 No content`  |
| List | - | Array of drivers as JSON (as described in Create) | `200 OK` |

### 2. Add uniqueness check

We want to make sure that there is one driver per phone number. What changes would you make to handle this uniqueness constraint?

# Part 2

### 1. Add availability helper methods on Driver

Drivers can be assigned to a ride using the `driver_id` foreign key in `rides`.

A driver is said to be "unavailable" at a specific time `time` when it has a ride at time `time`
(`time` is between `ride.pick_up_datetime` and `ride.drop_off_datetime`).

Add the methods `Driver#available?` (for `time = Time.now`) and `Driver#available_at?(time)` for a custom `time`,
returning whether the driver is available.

### 2. Find available drivers

Write the necessary code so that `Driver.available_at(time)` returns a collection of the drivers
available at `time`.

### 3. Simple dispatcher (ignore approach time and distances)

1. Add a method `Ride#dispatch`, that gets an available driver for the ride, and sets the driver of the ride.

2. Make the necessary changes so that the dispatch is done automatically during the creation of the ride.
