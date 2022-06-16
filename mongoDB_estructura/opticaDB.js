db.dropDatabase();

db.suppliers.insertMany([ 
    {
        supplier_id: 'Pinco',
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
        supplier_id: 'Dibo',
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

db.employees.insertMany([ 
    {
        employee_id: 'Pepe',
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
        employee_id: 'Pepa',
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

db.clients_glasses.insertMany([ 
    {
        client_id: 'Nino',
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
        client_id: 'Nina',
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
    },
    {
        glass_id: 1,
        client_id: 'Nino',
        supplier_id: 'Pinco', 
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
        glass_id: 2,
        client_id: null,
        supplier_id: 'Dibo',
        employee_id: null,
        brand: 'cuore',
        gradue: 0.2,
        frame: 'Pasta',
        colorFrame: 'white',
        colorLens: 'clear',
        price: 35.5,
        whenSell: null
    },
    { 
        glass_id: 3,
        client_id: 'Nina',
        supplier_id: 'Pinco',
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
        glass_id: 4,
        client_id: null,
        supplier_id: 'Pinco',
        employee_id: null,
        brand: 'rufus',
        gradue: 0.2,
        frame: 'Metallica',
        colorFrame: 'green',
        colorLens: 'yellow',
        price: 65.5,
        whenSell: null
    }
]);


