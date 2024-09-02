sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'music/test/integration/FirstJourney',
		'music/test/integration/pages/songList',
		'music/test/integration/pages/songObjectPage'
    ],
    function(JourneyRunner, opaJourney, songList, songObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('music') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThesongList: songList,
					onThesongObjectPage: songObjectPage
                }
            },
            opaJourney.run
        );
    }
);