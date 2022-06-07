db.suppliers.drop();

db.suppliers.insertMany([ 
    {
        name: 'Pinco',
        telephone: '+34 926 123 456', 
        fax: '+34 678 567 567', 
        NIF: '56748956N' 
    },
    { 
        name: 'DiboDabo',
        telephone: '+34 865 987 234', 
        fax: '+34 865 987 234', 
        NIF: '12345656P' 
    }
]);

db.clients.drop();

db.clients.insertMany([ 
    {
        name: 'Nino Rota',
        telephone: '+34 926 127 569', 
        mail: 'fr@gm.com', 
        dateRegister: new Date('2022-02-22'),
        recommendedBy: null
    },
    { 
        name: 'Nina Nera',
        telephone: '+34 912 765 324', 
        mail: 'rom@gm.com', 
        dateRegister: new Date('2022-03-12'),
        recommendedBy: 'Nino Rota'
    }
]);

db.employees.insertMany([ 
    {
        name: 'Pepe Pio',
        telephone: '+34 926 127 569', 
        mail: 'pepe@gm.com'
    },
    { 
        name: 'Pepa Mia',
        telephone: '+34 934 567 904', 
        mail: 'pepa@gm.com'
    }
]);

db.glasses.insertMany([ 
    {
        supplier: 'Pinco',
        client: 'Nino Rota', 
        employee: 'Pepe Pio',
        brand: 'rasband',
        gradue: 0.2,
        frame: 'Flotant',
        colorFrame: 'black',
        colorLens: 'blue',
        price: 45.5,
        whenSell: new Date('2020-02-22')
    },
    { 
        supplier: 'Pinco',
        client: 'Nina Nera', 
        employee: 'Pepa Mia',
        brand: 'armadi',
        gradue: 0.1,
        frame: 'Metallica',
        colorFrame: 'brown',
        colorLens: 'red',
        price: 82.5,
        whenSell: new Date('2021-03-12')
    }
]);
