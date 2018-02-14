using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThirdManRecords.Models;
using ThirdManRecords.ViewModels;

namespace ThirdManRecords.Controllers
{
    public class RecordsController : Controller
    {
        // /records/
        public ActionResult Index()
        {
            var db = new ThirdManContext();

            var query = from r in db.records
                        select r;

            var records = new List<Record> { };

            foreach (var record in query)
            {
                records.Add(record);
            }

            return View(records);
        }

        // /records/details?code={code}
        public ActionResult Details(string code)
        {
            //build the view model
            var viewModel = new RecordDetailsViewModel();

            //connect to the database
            var db = new ThirdManContext();

            //get the record with code 'code'
            var query = from r in db.records
                        where r.code == code
                        select r;

            foreach (var rec in query)
            {
                viewModel.record = rec;
            };

            //get the editions of the record
            var query2 = from e in db.record_editions
                         where e.record == code
                         select e;

            foreach(var edition in query2)
            {
                viewModel.record_editions.Add(edition);
            };

            //get the songs of the record
            var query3 = from s in db.songs
                         where s.record == code
                         select s;

            foreach(var song in query3)
            {
                viewModel.songs.Add(song);

                //get the credits of the song
                var query4 = from c in db.song_credits
                             where c.song == song.code
                             select c;

                foreach(var credit in query4)
                {
                    viewModel.song_credits.Add(credit);
                };
            };

            //get the credits of the record
            var query5 = from c in db.record_credits
                         where c.record == code
                         select c;

            foreach(var credit in query5)
            {
                viewModel.record_credits.Add(credit);
            };
            
            return View(viewModel);
        }

        // /records/blue-series
        public ActionResult BlueSeries()
        {
            var db = new ThirdManContext();

            var query = from r in db.records
                        where r.series == "Blue Series"
                        select r;

            var records = new List<Record> { };

            foreach (var record in query)
            {
                records.Add(record);
            }

            return View(records);
        }
    }
}