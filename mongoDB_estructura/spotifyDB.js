db.dropDatabase();

db.users.insertMany([ 
    {
        user_id: 1,
        mail: 'nino@gm.com',
        password: '1234',
        username: 'pingpong',
        birth: new ISODate('1990-06-07T12:20:00Z'),
        sex: 'H',
        country: 'Italy',
        zipcode: '12345',
        type: 'free' 
    },
    { 
        user_id: 2,
        mail: 'nina@gm.com',
        password: '1234',
        username: 'paolina',
        birth: new ISODate('1980-02-07T12:20:00Z'),
        sex: 'M',
        country: 'Italy',
        zipcode: '12345',
        type: 'premium'
    },
    { 
        user_id: 3,
        mail: 'pina@gm.com',
        password: '1234',
        username: 'pinuccia',
        birth: new ISODate('1985-02-07T12:20:00Z'),
        sex: 'M',
        country: 'Italy',
        zipcode: '12345',
        type: 'premium'
    }
]);