db.clients.drop();

db.clients.insertMany([ 
    {
        _id: 'Nino',
        name: 'Nino',
        surname: 'Rota',
        address: 'c/ de la pedra, 6',
        localidad: 'Montgat',
        provincia: 'Barcelona',
        telephone: '+34 926 127 569' 
    },
    { 
        _id: 'Nina',
        name: 'Nina',
        surname: 'Nera',
        address: 'c/ del papel, 53',
        localidad: 'Palamós',
        provincia: 'Gerona',
        telephone: '+34 912 765 324'
    }
]);

db.employees_shop.drop();

db.employees_shop.insertMany([ 
    {
        _id: 1,
        address: 'av. Roma, 140',
        zipcode: '12345',
        localidad: 'Barcelona',
        provincia: 'Barcelona'
    },
    {
        _id: 2,
        address: 'c/ Marina, 67',
        zipcode: '45678',
        localidad: 'Gerona',
        provincia: 'Gerona'
    },

    {
        _id: 'Pepe',
        name: 'Pepe',
        surname: 'Pio',
        NIF: '34856404K',
        rule: 'Cuiner',
        telephone: '+34 926 127 569', 
        shop_id: 1 
    },
    {
        _id: 'Ava',
        name: 'Ava',
        surname: 'Farina',
        NIF: '34856404K',
        rule: 'Cuiner',
        telephone: '+34 678 854 023', 
        shop_id: 2 
    },
    {
        _id: 'Isolda',
        name: 'Isolda',
        surname: 'Nero',
        NIF: '34856404K',
        rule: 'Repartidor',
        telephone: '+34 678 854 023', 
        shop_id: 1 
    },
    {
        _id: 'Alex',
        name: 'Alex',
        surname: 'Zana',
        NIF: '74216404K',
        rule: 'Repartidor',
        telephone: '+34 478 254 923', 
        shop_id: 2 
    }
]);

db.products_orders.drop();

db.products_orders.insertMany([
    {
        _id: 100,
        name: 'Pizza Margherita',
        description: 'tomate, mozzarella, albahaja',
        image: './img/img.jpg',
        price: 7.5,
        category: 'Category Mare' 
    },
    {
        _id: 101,
        name: 'Pizza 4 quesos',
        description: 'tomate, mozzarella, fontina, grana, gorgonzola',
        image: './img/img.jpg',
        price: 10,
        category: 'Category Montaña' 
    },
    {
        _id: 200,
        name: 'Hamburger clasico',
        description: 'tomate, mozzarella, ternera 200gr',
        image: './img/img.jpg',
        price: 8
    },
    {
        _id: 201,
        name: 'Hamburger con queso',
        description: 'tomate, fontina, ternera 200gr',
        image: './img/img.jpg',
        price: 9
    },
    {
        _id: 300,
        name: 'wine',
        description: 'White, Penedes 2016',
        image: './img/img.jpg',
        price: 8
    },
    {
        _id: 301,
        name: 'water',
        description: 'Bezoya',
        image: './img/img.jpg',
        price: 1.5
    },

    {
        _id: 1,
        date: new ISODate('2022-06-07T12:20:00Z'),
        delivery: 'home',
        client_id: 'Nino',
        shop_id: 1,
        product_id: [100, 200],
        date_delivery: new ISODate('2022-06-07T12:22:00Z') 
    },
    {
        _id: 2,
        date: new ISODate('2022-06-07T12:30:00Z'),
        delivery: 'home',
        client_id: 'Nino',
        shop_id: 1,
        product_id: [300],
        date_delivery: new ISODate('2022-06-07T12:32:00Z') 
    },
    {
        _id: 3,
        date: new ISODate('2022-06-07T12:40:00Z'),
        delivery: 'shop',
        client_id: 'Nina',
        shop_id: 2,
        product_id: [100, 101, 201, 301]
    }
]);