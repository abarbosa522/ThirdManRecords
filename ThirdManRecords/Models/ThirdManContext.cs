namespace ThirdManRecords.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ThirdManContext : DbContext
    {
        public ThirdManContext()
            : base("name=ThirdManContext")
        {
        }

        public virtual DbSet<Alias> aliases { get; set; }
        public virtual DbSet<Artist> artists { get; set; }
        public virtual DbSet<BandMember> band_members { get; set; }
        public virtual DbSet<RecordCredit> record_credits { get; set; }
        public virtual DbSet<RecordEdition> record_editions { get; set; }
        public virtual DbSet<Record> records { get; set; }
        public virtual DbSet<SongCredit> song_credits { get; set; }
        public virtual DbSet<Song> songs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Alias>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<Alias>()
                .Property(e => e.artist)
                .IsUnicode(false);

            modelBuilder.Entity<Artist>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Artist>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<Artist>()
                .Property(e => e.picture)
                .IsUnicode(false);

            modelBuilder.Entity<Artist>()
                .Property(e => e.full_picture)
                .IsUnicode(false);

            modelBuilder.Entity<Artist>()
                .Property(e => e.type)
                .IsUnicode(false);

            modelBuilder.Entity<Artist>()
                .HasMany(e => e.aliases)
                .WithRequired(e => e.artist1)
                .HasForeignKey(e => e.artist)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Artist>()
                .HasMany(e => e.bandMembers)
                .WithRequired(e => e.artist)
                .HasForeignKey(e => e.member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Artist>()
                .HasMany(e => e.bandMembers1)
                .WithRequired(e => e.artist1)
                .HasForeignKey(e => e.band)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Artist>()
                .HasMany(e => e.recordCredits)
                .WithRequired(e => e.artist1)
                .HasForeignKey(e => e.artist)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Artist>()
                .HasMany(e => e.records)
                .WithRequired(e => e.artist1)
                .HasForeignKey(e => e.artist)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Artist>()
                .HasMany(e => e.songCredits)
                .WithRequired(e => e.artist1)
                .HasForeignKey(e => e.artist)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BandMember>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<BandMember>()
                .Property(e => e.band)
                .IsUnicode(false);

            modelBuilder.Entity<BandMember>()
                .Property(e => e.member)
                .IsUnicode(false);

            modelBuilder.Entity<BandMember>()
                .Property(e => e.role)
                .IsUnicode(false);

            modelBuilder.Entity<RecordCredit>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<RecordCredit>()
                .Property(e => e.record)
                .IsUnicode(false);

            modelBuilder.Entity<RecordCredit>()
                .Property(e => e.artist)
                .IsUnicode(false);

            modelBuilder.Entity<RecordCredit>()
                .Property(e => e.role)
                .IsUnicode(false);

            modelBuilder.Entity<RecordEdition>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<RecordEdition>()
                .Property(e => e.record)
                .IsUnicode(false);

            modelBuilder.Entity<RecordEdition>()
                .Property(e => e.edition)
                .IsUnicode(false);

            modelBuilder.Entity<RecordEdition>()
                .Property(e => e.quantity)
                .IsUnicode(false);

            modelBuilder.Entity<RecordEdition>()
                .Property(e => e.picture)
                .IsUnicode(false);

            modelBuilder.Entity<Record>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<Record>()
                .Property(e => e.artist)
                .IsUnicode(false);

            modelBuilder.Entity<Record>()
                .Property(e => e.title)
                .IsUnicode(false);

            modelBuilder.Entity<Record>()
                .Property(e => e.cover)
                .IsUnicode(false);

            modelBuilder.Entity<Record>()
                .Property(e => e.full_cover)
                .IsUnicode(false);

            modelBuilder.Entity<Record>()
                .Property(e => e.release_date)
                .IsUnicode(false);

            modelBuilder.Entity<Record>()
                .Property(e => e.series)
                .IsUnicode(false);

            modelBuilder.Entity<Record>()
                .Property(e => e.store_link)
                .IsUnicode(false);

            modelBuilder.Entity<Record>()
                .Property(e => e.spotify_link)
                .IsUnicode(false);

            modelBuilder.Entity<Record>()
                .HasMany(e => e.recordCredits)
                .WithRequired(e => e.record1)
                .HasForeignKey(e => e.record)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Record>()
                .HasMany(e => e.recordEditions)
                .WithRequired(e => e.record1)
                .HasForeignKey(e => e.record)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Record>()
                .HasMany(e => e.songs)
                .WithRequired(e => e.record1)
                .HasForeignKey(e => e.record)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SongCredit>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<SongCredit>()
                .Property(e => e.song)
                .IsUnicode(false);

            modelBuilder.Entity<SongCredit>()
                .Property(e => e.artist)
                .IsUnicode(false);

            modelBuilder.Entity<SongCredit>()
                .Property(e => e.role)
                .IsUnicode(false);

            modelBuilder.Entity<Song>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<Song>()
                .Property(e => e.record)
                .IsUnicode(false);

            modelBuilder.Entity<Song>()
                .Property(e => e.title)
                .IsUnicode(false);

            modelBuilder.Entity<Song>()
                .Property(e => e.track)
                .IsUnicode(false);

            modelBuilder.Entity<Song>()
                .HasMany(e => e.songCredits)
                .WithRequired(e => e.song1)
                .HasForeignKey(e => e.song)
                .WillCascadeOnDelete(false);
        }
    }
}
