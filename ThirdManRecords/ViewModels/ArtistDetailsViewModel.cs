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
        public List<Record> records { get; set; }
        public List<BandMember> band_members { get; set; }
        public List<Song> songs { get; set; }
        public List<SongCredit> song_credits { get; set; }
        public List<Record> song_credits_records { get; set; }
        public List<RecordCredit> record_credits { get; set; }
        public List<Record> record_credits_records { get; set; }

        public ArtistDetailsViewModel()
        {
            artist = new Artist();
            records = new List<Record>();
            band_members = new List<BandMember>();
            songs = new List<Song>();
            song_credits = new List<SongCredit>();
            song_credits_records = new List<Record>();
            record_credits = new List<RecordCredit>();
            record_credits_records = new List<Record>();
        }

    }
}