using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ThirdManRecords.Models;

namespace ThirdManRecords.ViewModels
{
    public class RecordDetailsViewModel
    {

        public Record record { get; set; }
        public List<RecordEdition> record_editions { get; set; }
        public List<Song> songs { get; set; }
        public List<RecordCredit> record_credits { get; set; }
        public List<SongCredit> song_credits { get; set; }

        public RecordDetailsViewModel()
        {
            record = new Record();
            record_editions = new List<RecordEdition>();
            songs = new List<Song>();
            record_credits = new List<RecordCredit>();
            song_credits = new List<SongCredit>();
        }
    }
}