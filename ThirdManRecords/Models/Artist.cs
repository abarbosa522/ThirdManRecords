namespace ThirdManRecords.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Artist
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Artist()
        {
            band_members = new HashSet<BandMember>();
            band_members1 = new HashSet<BandMember>();
            record_credits = new HashSet<RecordCredit>();
            records = new HashSet<Record>();
            song_credits = new HashSet<SongCredit>();
        }

        [Key]
        [StringLength(255)]
        public string name { get; set; }

        [Required]
        [StringLength(255)]
        public string description { get; set; }

        [Required]
        [StringLength(255)]
        public string picture { get; set; }

        [Required]
        [StringLength(255)]
        public string full_picture { get; set; }

        [Required]
        [StringLength(255)]
        public string type { get; set; }

        public bool band { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BandMember> band_members { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BandMember> band_members1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RecordCredit> record_credits { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Record> records { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SongCredit> song_credits { get; set; }
    }
}
