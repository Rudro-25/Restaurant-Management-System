`go run main.go`

or using docker [don't know how it worked for the second time]
```
docker stop mongo
docker rm mongo
docker pull mongo
docker run --name mongo -d -p 27017:27017 mongo
```

# API

-----------------User-Route-----------------

#1. AuthSIgnUp:

Api-path: `localhost:8080/users/signup` [POST]

Data: [Body/raw]
```
{
    "First_name":"Rudro",
    "Last_name":"Debnath",
    "Password":"1234abcd",
    "Email":"rudro.cse5.bu@gmail.com",
    "Phone":"01741960830",
    "User_type":"ADMIN"
}
```

#2. Login:

api: `localhost:8080/users/login` [POST]

Data: [Body/raw]
```
{
    "Password":"1234abcd",
    "Email":"rudro.cse5.bu@gmail.com"
}
```

#3. GetUser/:user-id [GET]

Get the user-id and token from login api response.

api: `localhost:8080/users/<user-id>`

Body: empty

#4. GetAllUsers [Not worked - returned null] [GET]

Need token in Header as always

api: `http://localhost:8080/users`



-----------------Menu-Route-----------------

#1. CreateMenu

api: `localhost:8080/menus` [POST]

Add the token in `Headers`, got it from Login-api response.

Data: [Body/raw]

```
{
    "Name": "kacci",
    "Category":"Biriani",
    "Start_Date": "2025-07-15T00:00:00Z",
    "End_Date": "2025-07-30T00:00:00Z"
}
```

#2. GetMenus (All the menu list)

api: `localhost:8080/menus` [GET]

Add the token in `Headers`, got it from Login-api response.

#3. GetMenus/:menu-id

api: `localhost:8080/menus/<menu-id>` [GET]

Add the token in `Headers`, got it from Login-api response.


#4. UpdateMenu 

api: `localhost:8080/menus/<menu-id>` [PATCH]

Add the token in `Headers`, got it from Login-api response.

Data: [Start_Date >= time.Now && End_Date >= Start_date]

```
{
    "Name":"Bashmoti-Kacci",
    "Start_Date": "2025-07-15T00:00:00Z",
    "End_Date": "2025-08-30T00:00:00Z"
}
```

-----------------Food-Route-----------------

#1. Create/AddFood

api: `localhost:8080/foods` [POST]

Add the token in `Headers`, got it from Login-api response.

Data: [Body/raw] [Menu_id must be any of previous inserted one, foreign key]

```
{
    "Name": "premium-bashmoti-kacci",
    "Price":300,
    "Food_image": "https://www.pexels.com/photo/flat-lay-photography-of-vegetable-salad-on-plate-1640777/",
    "Menu_id": "6873b3816cee7ddd8a84c193"
}
```

#2. GeFoods (All the food list)

api: `localhost:8080/foods` [GET]

Add the token in `Headers`, got it from Login-api response.

#3. GetFoods/:food-id

api: `localhost:8080/foods/<food-id>` [GET]

Add the token in `Headers`, got it from Login-api response.


#4. UpdateFood

api: `localhost:8080/foods/<food-id>` [PATCH]

Add the token in `Headers`, got it from Login-api response.

Data: 

```
{
    "price":400
}
```

-----------------Table-Route-----------------

#1. Create/AddTable

api: `localhost:8080/tables` [POST]

Add the token in `Headers`, got it from Login-api response.

Data: [Body/raw] [Menu_id must be any of previous inserted one, foreign key]

```
{
    "Number_of_guests":5,
    "Table_number":356
}
```

#2. GetTables (All the table list)

api: `localhost:8080/tables` [GET]

Add the token in `Headers`, got it from Login-api response.

#3. GetTables/:table-id

api: `localhost:8080/foods/<table-id>` [GET]

Add the token in `Headers`, got it from Login-api response.


#4. UpdateTable

api: `localhost:8080/tables/<table-id>` [PATCH]

Add the token in `Headers`, got it from Login-api response.

Data: 

```
{
    "Number_of_guests":6
}
```

-----------------order-Route-----------------

#1. Create/AddOrder

api: `localhost:8080/orders` [POST]

Add the token in `Headers`, got it from Login-api response.

Data: [Body/raw] [Menu_id must be any of previous inserted one, foreign key]

```
{
    "Order_Date":"2025-07-13T00:00:00Z",
    "Table_id":"6873c4d5decd6f415ff9d894"
}
```

#2. GetOrders (All the order list)

api: `localhost:8080/orders` [GET]

Add the token in `Headers`, got it from Login-api response.

#3. GetOrders/:order-id

api: `localhost:8080/orders/<order-id>` [GET]

Add the token in `Headers`, got it from Login-api response.


#4. UpdateOrder

api: `localhost:8080/orders/<order-id>` [PATCH]

Table-id must be exist in the DB.
Add the token in `Headers`, got it from Login-api response.

Data: 

```
{
    "table_id":<table-id>>,
    "Order_Date":"2025-07-14T00:25:00Z"
}
```

-----------------OrderIem-Route-----------------

#1. Create/AddOrderItem

api: `localhost:8080/orders` [POST]

Add the token in `Headers`, got it from Login-api response.

Data: [Body/raw] [Menu_id must be any of previous inserted one, foreign key]

```
{
    "Order_Date":"2025-07-13T00:00:00Z",
    "Table_id":"6873c4d5decd6f415ff9d894"
}
```

#2. GetOrderItems (All the orderItem list)

api: `localhost:8080/orderItems` [GET]

Add the token in `Headers`, got it from Login-api response.

#3. GetOrderItems/OrderItemId

api: `localhost:8080/orderItems/<order-item-id>` [GET]

Add the token in `Headers`, got it from Login-api response.


#4. UpdateOrder

api: `localhost:8080/orders/<order-id>` [PATCH]

Table-id must be exist in the DB.
Add the token in `Headers`, got it from Login-api response.

Data: 

```
{
    "table_id":<table-id>>,
    "Order_Date":"2025-07-14T00:25:00Z"
}
```

-----------------User-Route-----------------




```