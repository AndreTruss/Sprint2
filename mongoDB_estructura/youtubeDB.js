db.users.drop();

db.users.insertMany([ 
    {
        user_id: 1,
        mail: 'nino@gm.com',
        password: '1234',
        username: 'pingpong',
        birth: new ISODate('2022-06-07T12:20:00Z'),
        sex: 'H',
        country: 'Italy',
        zipcode: '12345' 
    },
    { 
        user_id: 2,
        mail: 'nina@gm.com',
        password: '1234',
        username: 'paolina',
        birth: new ISODate('2022-02-07T12:20:00Z'),
        sex: 'M',
        country: 'Italy',
        zipcode: '12345'
    }
]);

db.videos.drop();

db.videos.insertMany([ 
    {
        video_id: 1,
        title: 'js example',
        description: 'lección js',
        Mb: '110',
        file: 'leccionjs.mp4',
        time: '00:30:10',
        thumbnail: './img/img.png',
        reproduction: 20,
        status: 'public',
        whenCreate: new ISODate('2022-06-07T12:20:00Z'),
        user_id: 1
    }
]);