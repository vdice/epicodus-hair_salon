# Hair Salon Management App

##### _A web app for Salon Owners to manage Stylists and Clients, August 21, 2015_

#### By **_Vaughn Dice_**

## Description

_Using this app, Salon Owners can:_
* _View, add, update and delete Stylists,_
* _View, add, update and delete Clients and_
* _Add Clients to a Stylist._

## Setup

* _Clone this repository_
* _Install necessary dependencies with: `bundle`_
* _Run specs with: `rspec`_

* _PostgreSQL database setup:_
```
psql
CREATE DATABASE hair_salon;
\c hair_salon
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```

## Technologies Used

_Ruby, rspec, Sinatra, Capybara, Postgres_

### Legal

Copyright (c) 2015 **_Vaughn Dice_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
