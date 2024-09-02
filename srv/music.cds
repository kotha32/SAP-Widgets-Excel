using { com.sumanth.music as db } from '../db/schema';

service music {
    entity song as projection on db.song;
    action musicData(jsonData:String);
}

annotate music.song with @odata.draft.enabled;


annotate music.song with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label: 'SongID',
            Value : song_id
        },
        {
            $Type : 'UI.DataField',
            Value : song_name
        },
        {
            $Type : 'UI.DataField',
            Value : song_url
        }
    ],
);
annotate music.song with @(
    UI.FieldGroup #songInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            $Type : 'UI.DataField',
            Label: 'SongID',
            Value : song_id
        },
        {
            $Type : 'UI.DataField',
            Value : song_name
        },
        {
            $Type : 'UI.DataField',
            Value : song_url
        }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'songInfoFacet',
            Label : 'song Information',
            Target : '@UI.FieldGroup#songInformation',
        },
    ],
);

