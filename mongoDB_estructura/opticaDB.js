db.suppliers.drop()

db.suppliers.insertMany([ 
    {
        _id: 'Pinco',
        name: 'Pinco Pallino',
        telephone: '+34 926 123 456', 
        fax: '+34 678 567 567', 
        NIF: '56748956N',
        address: {
            street: 'c/ de las rosas',
            number: 23,
            floor: 'entresuelo',
            door: '1ª',
            city: 'L Garriga',
            zipcode: '01234',
            country: 'Spain'
        } 
    },
    { 
        _id: 'Dibo',
        name: 'DiboDabo',
        telephone: '+34 865 987 234', 
        fax: '+34 865 987 234', 
        NIF: '12345656P',
        address: {
            street: 'c/ del vidres',
            number: 13,
            floor: '2º',
            door: '1ª',
            city: 'Manlleu',
            zipcode: '56789',
            country: 'Spain'
        }  
    }
]);

db.clients.drop();

db.clients.insertMany([ 
    {
        _id: 'Nino',
        name: 'Nino Rota',
        telephone: '+34 926 127 569', 
        mail: 'fr@gm.com', 
        dateRegister: new ISODate('2022-02-22'),
        recommendedBy: null,
        address: {
            street: 'c/ de la pedra',
            number: 143,
            floor: '1º',
            door: '5ª',
            city: 'Mongat',
            zipcode: '08123',
            country: 'Spain'
        } 
    },
    { 
        _id: 'Nina',
        name: 'Nina Nera',
        telephone: '+34 912 765 324', 
        mail: 'rom@gm.com', 
        dateRegister: new ISODate('2022-03-12'),
        recommendedBy: 'Nino Rota',
        address: {
            street: 'c/ del papel',
            number: 53,
            floor: 'atico',
            door: '1ª',
            city: 'Barcelona',
            zipcode: '08001',
            country: 'Spain'
        } 
    }
]);

db.employees.drop()

db.employees.insertMany([ 
    {
        _id: 'Pepe',
        name: 'Pepe Pio',
        telephone: '+34 926 127 569', 
        mail: 'pepe@gm.com',
        address: {
            street: 'c/ del carton',
            number: 21,
            floor: '3ª',
            door: '3ª',
            city: 'Barcelona',
            zipcode: '08012',
            country: 'Spain'
        } 
    },
    { 
        _id: 'Pepa',
        name: 'Pepa Mia',
        telephone: '+34 934 567 904', 
        mail: 'pepa@gm.com',
        address: {
            street: 'c/ de la fusta',
            number: 15,
            floor: '4ª',
            door: '2ª',
            city: 'Barcelona',
            zipcode: '08032',
            country: 'Spain'
        } 
    }
]);

db.glasses.drop()

db.glasses.insertMany([ 
    {
        _id: 1,
        supplier_id: 'Pinco',
        client_id: 'Nino', 
        employee_id: 'Pepe',
        brand: 'rasband',
        gradue: 0.2,
        frame: 'Metallica',
        colorFrame: 'black',
        colorLens: 'blue',
        price: 45.5,
        whenSell: new ISODate('2020-02-22')
    },
    { 
        _id: 2,
        supplier_id: 'Pinco',
        client_id: 'Nina', 
        employee_id: 'Pepa',
        brand: 'armadi',
        gradue: 0.1,
        frame: 'Flotant',
        colorFrame: 'brown',
        colorLens: 'red',
        price: 82.5,
        whenSell: new ISODate('2021-03-12')
    },
    { 
        _id: 3,
        supplier_id: 'Dibo',
        client_id: 'Nino', 
        employee_id: 'Pepe',
        brand: 'cuore',
        gradue: 0.2,
        frame: 'Pasta',
        colorFrame: 'white',
        colorLens: 'clear',
        price: 35.5,
        whenSell: new ISODate('2022-04-14')
    },
    { 
        _id: 4,
        supplier_id: 'Pinco',
        client_id: 'Nina', 
        employee_id: 'Pepa',
        brand: 'rufus',
        gradue: 0.2,
        frame: 'Metallica',
        colorFrame: 'green',
        colorLens: 'yellow',
        price: 65.5,
        whenSell: new ISODate('2022-05-02')
    },
    { 
        _id: 5,
        supplier_id: 'Dibo',
        client_id: 'Nino', 
        employee_id: 'Pepa',
        brand: 'valens',
        gradue: 0.1,
        frame:'Flotant',
        colorFrame: 'black',
        colorLens: 'clear',
        price: 52.5,
        whenSell: new ISODate('2022-06-22')
    }
]);

