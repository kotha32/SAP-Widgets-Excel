const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { song } = this.entities;

    this.on('musicData', async (req) => {
        const jsonData = JSON.parse(req.data.jsonData); // Parse JSON string

        const tx = cds.transaction(req);

        // Insert data into the railway entity
        const insertPromises = jsonData.map((data) => {
            return tx.run(
                INSERT.into(song).entries({
                    song_id: data.song_id || '',
                    song_name: data.song_name || '',
                    song_url: data.song_url || '',
                })
            );
        });

        await Promise.all(insertPromises);

        return { message: 'Data imported successfully!' };
    });
});