db.users.drop();

db.users.insertMany([ 
    {
        user_id: 1,
        mail: 'nino@gm.com',
        password: '1234',
        username: 'pingpong',
        birth: new ISODate('1990-06-07T12:20:00Z'),
        sex: 'H',
        country: 'Italy',
        zipcode: '12345' 
    },
    { 
        user_id: 2,
        mail: 'nina@gm.com',
        password: '1234',
        username: 'paolina',
        birth: new ISODate('1980-02-07T12:20:00Z'),
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
        user_id: 1,
        tickets: [{text: 'Javascript'},{text: 'js'}]
    },
    {
        video_id: 2,
        title: 'Mis gatos',
        description: 'gatos jugando',
        Mb: '100',
        file: 'gatos.mp4',
        time: '00:10:10',
        thumbnail: './img/img.png',
        reproduction: 10,
        status: 'public',
        whenCreate: new ISODate('2022-06-07T12:20:00Z'),
        user_id: 2,
        like_dislike: [{text:'like', date: new ISODate('2022-06-07T00:00:00Z'), user_id: 1}]
    }
]);

db.channels.drop();

db.channels.insertOne([
    {
        channel_id: 1,
        name: 'Gatos',
        description: 'Mis nuevos videos',
        date: new ISODate('2022-06-07T00:00:00Z'),
        user_id: 2,
        video_id: 2,
        subscriber: [{user_id: 1}]
    }
]);

db.playlists.drop();

db.playlists.insertOne([
    {
        playlist_id: 1,
        name: 'JS Lessons',
        date: new ISODate('2022-06-07T00:00:00Z'),
        status: 'public',
        user_id: 1,
        video_id: 1
    }
]);

db.comments.drop();

db.comments.insertOne([
    {
        comment_id: 1,
        text: 'Me gusta mucho',
        date: new ISODate('2022-06-07T00:00:00Z'),
        user_id: 1,
        video_id: 2,
        like_dislike: [{text:'like', date: new ISODate('2022-06-07T00:00:00Z'), user_id: 2}]
    }
]);