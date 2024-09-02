namespace com.sumanth.music;
using { managed, cuid } from '@sap/cds/common';


entity song : cuid, managed {
    key ID            : UUID;
    @title: 'SongID'
    song_id: String(30);
    @title: 'Song Name'
    song_name: String(50);
    @title: 'Song URL'
    song_url: String default 'https://www.youtube.com/watch?v=6f6T4Zg0gic';
    // Assuming there should be a relation to artist
}

