using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThirdManRecords.Models;
using ThirdManRecords.ViewModels;

namespace ThirdManRecords.Controllers
{
    public class ArtistsController : Controller
    {
        // /artists/
        public ActionResult Index()
        {
            var db = new ThirdManContext();

            var query = from a in db.artists
                        select a;

            var artists = new List<Artist> { };

            foreach (var artist in query)
            {
                artists.Add(artist);
            }

            return View(artists);
        }

        // /artists/details?name={name}
        public ActionResult Details(string name)
        {
            //build the view model
            var viewModel = new ArtistDetailsViewModel();

            //connect to the database
            var db = new ThirdManContext();

            //get the artist with name 'name'
            var query = from a in db.artists
                        where a.name == name
                        select a;

            foreach (var artst in query)
            {
                viewModel.artist = artst;
            };

            //get the records of the artist
            var query2 = from r in db.records
                        where r.artist == viewModel.artist.name
                        select r;

            foreach(var record in query2)
            {
                viewModel.records.Add(record);
            }

            //if the artist is a band - get the band members
            if (viewModel.artist.band)
            {   
                var query3 = from b in db.band_members
                             where b.band == viewModel.artist.name
                             select b;

                foreach(var member in query3)
                {
                    viewModel.band_members.Add(member);
                }
            }
            //if the artist is not a band, get the record and song credits
            else
            {
                //get the song credits and respective songs and records
                var query4 = from r in db.song_credits
                             where r.artist == viewModel.artist.name
                             select r;

                foreach (var credit in query4)
                {
                    viewModel.song_credits.Add(credit);

                    var query5 = from s in db.songs
                                 where s.code == credit.song
                                 select s;

                    foreach(var song in query5)
                    {
                        if(!viewModel.songs.Contains(song))
                        {
                            viewModel.songs.Add(song);

                            var query6 = from r in db.records
                                         where r.code == song.record
                                         select r;

                            foreach (var record in query6)
                            {
                                if(!viewModel.song_credits_records.Contains(record))
                                {
                                    viewModel.song_credits_records.Add(record);
                                }
                            }
                        }
                    }
                }

                //get the record credits and respective records
                var query7 = from r in db.record_credits
                             where r.artist == viewModel.artist.name
                             select r;

                foreach (var credit in query7)
                {
                    viewModel.record_credits.Add(credit);

                    var query8 = from r in db.records
                                 where r.code == credit.record
                                 select r;

                    foreach(var rec in query8)
                    {
                        if (!viewModel.record_credits_records.Contains(rec))
                        {
                            viewModel.record_credits_records.Add(rec);
                        }
                    }
                }
            }

            //return the view model
            return View(viewModel);
        }

    }
}