using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ThirdManRecords.Models;

namespace ThirdManRecords.ViewModels
{
    public class ArtistDetailsViewModel
    {

        public Artist artist { get; set; }
        public List<Record> own_records { get; set; }
        public List<BandMember> band_members { get; set; }
        public List<Song> songs { get; set; }
        public List<SongCredit> song_credits { get; set; }
        public List<Record> not_own_records { get; set; }
        public List<RecordCredit> record_credits { get; set; }

        public ArtistDetailsViewModel()
        {
            artist = new Artist();
            own_records = new List<Record>();
            band_members = new List<BandMember>();
            songs = new List<Song>();
            song_credits = new List<SongCredit>();
            not_own_records = new List<Record>();
            record_credits = new List<RecordCredit>();
        }

    }
}