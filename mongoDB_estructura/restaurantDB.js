db.dropDatabase();

db.products.insertMany([
    {
        product_id: 100,
        name: 'Pizza Margherita',
        description: 'tomate, mozzarella, albahaja',
        image: './img/img.jpg',
        price: 7.5,
        category: 'Category Mare' 
    },
    {
        product_id: 101,
        name: 'Pizza 4 quesos',
        description: 'tomate, mozzarella, fontina, grana, gorgonzola',
        image: './img/img.jpg',
        price: 10,
        category: 'Category Montaña' 
    },
    {
        product_id: 200,
        name: 'Hamburger clasico',
        description: 'tomate, mozzarella, ternera 200gr',
        image: './img/img.jpg',
        price: 8
    },
    {
        product_id: 201,
        name: 'Hamburger con queso',
        description: 'tomate, fontina, ternera 200gr',
        image: './img/img.jpg',
        price: 9
    },
    {
        product_id: 300,
        name: 'wine',
        description: 'White, Penedes 2016',
        image: './img/img.jpg',
        price: 8
    },
    {
        product_id: 301,
        name: 'water',
        description: 'Bezoya',
        image: './img/img.jpg',
        price: 1.5
    }
]);

db.provincias.insertMany([
    {
        provincia_id: 1,
        name: 'Barcelona',
        localitats: [
            {localitat_id: 1, name: 'Arenys de Mar'},
            {localitat_id: 2, name: 'Barcelona'},
            {localitat_id: 3, name: 'Canet de Mar'}
    ]
    },
    {
        provincia_id: 2,
        name: 'Gerona',
        localitats: [
            {localitat_id: 4, name: 'Gerona'},
            {localitat_id: 5, name: 'Figueras'},
            {localitat_id: 6, name: 'Palamós'}
    ]
    },
    {
        provincia_id: 3,
        name: 'Lleida',
        localitats: [
            {localitat_id: 7, name: 'Alfarràs'},
            {localitat_id: 8, name: 'Lleida'},
            {localitat_id: 9, name: 'Verdú'}
    ]
    },
    {
        provincia_id: 4,
        name: 'Tarragona',
        localitats: [
            {localitat_id: 10, name: 'Reus'},
            {localitat_id: 11, name: 'Tarragona'},
            {localitat_id: 12, name: 'Vila-Seca'}
    ]
    }
])

db.clients_orders.insertMany([ 
    {
        client_id: 'Nino',
        name: 'Nino',
        surname: 'Rota',
        address: 'c/ de la pedra, 6',
        localitat_id: 1,
        provincia_id: 1,
        telephone: '+34 926 127 569', 
        orders: [{
            order_id: 1,
            date: new ISODate('2022-06-07T12:20:00Z'),
            delivery: 'home',
            shop_id: 1,
            product_id: [100, 200],
            total_price: 17.5,
            employee_id: 'Isolda',
            date_delivery: new ISODate('2022-06-07T12:22:00Z') 
        },
        {
            order_id: 2,
            date: new ISODate('2022-06-07T12:30:00Z'),
            delivery: 'home',
            shop_id: 1,
            product_id: [300],
            total_price: 8,
            employee_id: 'Isolda',
            date_delivery: new ISODate('2022-06-07T12:32:00Z') 
        }]
    },
    { 
        client_id: 'Nina',
        name: 'Nina',
        surname: 'Nera',
        address: 'c/ del papel, 53',
        localitat_id: 6,
        provincia_id: 2,
        telephone: '+34 912 765 324',
        orders: {
            order_id: 3,
            date: new ISODate('2022-06-07T12:40:00Z'),
            delivery: 'shop',
            shop_id: 2,
            product_id: [100, 101, 201, 301],
            total_price: 28
        }
    }
]);


db.employees_shop.insertMany([ 
    {
        shop_id: 1,
        address: 'av. Roma, 140',
        zipcode: '12345',
        localitat_id: 2,
        provincia_id: 1,
        employees:[{
            employee_id: 'Pepe',
            name: 'Pepe',
            surname: 'Pio',
            NIF: '34856404K',
            rule: 'Cuiner',
            telephone: '+34 926 127 569'
        },
        {
            employee_id: 'Isolda',
            name: 'Isolda',
            surname: 'Nero',
            NIF: '34856404K',
            rule: 'Repartidor',
            telephone: '+34 678 854 023' 
        }]
    },
    {
        shop_id: 2,
        address: 'c/ Marina, 67',
        zipcode: '45678',
        localitat_id: 4,
        provincia_id: 2,
        employees: [{
            employee_id: 'Ava',
            name: 'Ava',
            surname: 'Farina',
            NIF: '34856404K',
            rule: 'Cuiner',
            telephone: '+34 678 854 023'  
        },
        {
            employee_id: 'Alex',
            name: 'Alex',
            surname: 'Zana',
            NIF: '74216404K',
            rule: 'Repartidor',
            telephone: '+34 478 254 923'
        }]
    }  
]);



