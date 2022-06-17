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
        type: 'premium',
        subscription: {
            subscription_id: 1,
            start_date: new ISODate('2021-11-07T12:20:00Z'),
            end_date: new ISODate('2022-11-07T12:20:00Z'),
            payment_mode: 'credit card',
            credit_card:{
                number: '1223 3224 5433 2133',
                caducity: '2024-05',
                code: '023'
            },
            payments: [{ date_pay: new ISODate('2022-06-07T12:20:00Z'), amount: 18.5 }]
        },
        playlists: [
            {
            playlist_id: 1,
            title: 'My music',
            number_songs: 3,
            date_creation: new ISODate('2022-06-07T12:20:00Z'),
            status: 'eliminated',
            date_elimination: new ISODate('2022-06-09T12:20:00Z')
            },
            {
            playlist_id: 2,
            title: 'My new music',
            number_songs: 5,
            date_creation: new ISODate('2022-06-17T12:20:00Z'),
            status: 'active',
            who_share: [
                {

            }]
            }
        ]
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
        type: 'premium',
        subscription: {
            subscription_id: 2,
            start_date: new ISODate('2022-01-07T12:20:00Z'),
            end_date: new ISODate('2023-01-07T12:20:00Z'),
            payment_mode: 'paypal',
            paypal: {user_name: 'od@sd.es'},
            payments: [{ date_pay: new ISODate('2022-01-07T12:20:00Z'), amount: 10.5 }]
        }
    }
]);

db.artist_album_song.insertMany([
    {
        artist_id: 1,
        artist_name: 'A. Mozart',
        image_artist: './img/img.jpg',
        related_artist: ['J.S. Bach', 'A. Vivaldi'],
        albums: [
            {
            album_id: 1,
            title_album: 'Todo Mozart',
            year_publication: '1980',
            image_album: './img/img.jpg',
            songs: [
                {
                song_id: 1,
                title_song: 'Il flauto magico',
                duration: '00:05:34',
                number_reproductions: 20,
                who_share_user_id: 2,
                when_share: new ISODate('2022-06-17T12:20:00Z')
                },
                {
                song_id: 2,
                title_song: 'Sinfonia n 40',
                duration: '00:08:34',
                number_reproductions: 30,
                who_share_user_id: 3,
                when_share: new ISODate('2022-06-18T12:20:00Z')
                }
            ]
            },
            {
                album_id: 2,
                title_album: 'Playing Mozart',
                year_publication: '1995',
                image_album: './img/img.jpg',
                songs: [
                    {
                    song_id: 3,
                    title_song: 'Sinfonia n 41',
                    duration: '00:10:34',
                    number_reproductions: 20,
                    who_share_user_id: 2,
                    when_share: new ISODate('2022-06-17T12:20:00Z')
                    },
                    {
                    song_id: 4,
                    title_song: 'Sinfonia n 42',
                    duration: '00:09:34',
                    number_reproductions: 30,
                    who_share_user_id: 3,
                    when_share: new ISODate('2022-06-18T12:20:00Z')
                    }
                ]
                }
        ]
    },
    {
        artist_id: 2,
        artist_name: 'J.S. Bach',
        image_artist: './img/img.jpg',
        related_artist: ['A. Mozart', 'A. Vivaldi'],
        albums: [
            {
            album_id: 3,
            title_album: 'Todo Bach',
            year_publication: '2002',
            image_album: './img/img.jpg',
            songs: [
                {
                song_id: 5,
                title_song: 'La ciaccona',
                duration: '00:05:34',
                number_reproductions: 20,
                who_share_user_id: 1,
                when_share: new ISODate('2022-06-17T12:20:00Z')
                },
                {
                song_id: 6,
                title_song: 'Preludio e Fuga',
                duration: '00:06:34',
                number_reproductions: 30,
                who_share_user_id: 2,
                when_share: new ISODate('2022-06-18T12:20:00Z')
                }
            ]
            }
        ]
    }
]);