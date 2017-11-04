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

        // /artists/details/{name}
        public ActionResult Details(string name)
        {
            //build the view model
            var viewModel = new ArtistDetailsViewModel();

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
                viewModel.own_records.Add(record);
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
            //if the artist is not a band, get the not own records, record credits, songs and song credits
            else
            {
                var query4 = from r in db.record_credits
                             where r.artist == viewModel.artist.name
                             select r;

                foreach (var credit in query4)
                {
                    viewModel.record_credits.Add(credit);
                }

                var query5 = from r in db.song_credits
                             where r.artist == viewModel.artist.name
                             select r;

                foreach (var credit in query5)
                {
                    viewModel.song_credits.Add(credit);
                }

            }

            //return the view model
            return View(viewModel);
        }

    }
}