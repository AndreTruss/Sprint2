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
        playlists: {
            playlist_id: 1,
            video_id: 1,
            name: 'JS Lessons',
            date: new ISODate('2022-06-07T00:00:00Z'),
            status: 'public'
        },
        comments: {
            comment_id: 1,
            video_id: 2,
            text: 'Me gusta mucho',
            date: new ISODate('2022-06-07T00:00:00Z'),
            like_dislike_comment: [{text:'like', date: new ISODate('2022-06-07T00:00:00Z'), user_id: 2}]
        },
        like_dislike_video: [{text:'like', date: new ISODate('2022-06-07T00:00:00Z'), video_id: 2}] 
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
        channels: {
            channel_id: 1,
            video_id: 2,
            name: 'Gatos',
            description: 'Mis nuevos videos',
            date: new ISODate('2022-06-07T00:00:00Z'),
            subscriber: [{user_id: 1}]
        }
    }
]);


db.videos.insertMany([ 
    {
        video_id: 1,
        user_id: 1,
        title: 'js example',
        description: 'lección js',
        Mb: '110',
        file: 'leccionjs.mp4',
        time: '00:30:10',
        thumbnail: './img/img.png',
        reproduction: 20,
        status: 'public',
        whenCreate: new ISODate('2022-06-07T12:20:00Z'),
        number_like: 5,
        number_dislike: 0,
        tickets: [{ticket_id: 1, text: 'Javascript'},{ticket_id: 2, text: 'js'}]
    },
    {
        video_id: 2,
        user_id: 2,
        title: 'Mis gatos',
        description: 'gatos jugando',
        Mb: '100',
        file: 'gatos.mp4',
        time: '00:10:10',
        thumbnail: './img/img.png',
        reproduction: 10,
        status: 'public',
        whenCreate: new ISODate('2022-06-07T12:20:00Z'),
        number_like: 5,
        number_dislike: 0
    }
]);
