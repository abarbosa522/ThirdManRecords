namespace ThirdManRecords.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Record
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Record()
        {
            record_credits = new HashSet<RecordCredit>();
            record_editions = new HashSet<RecordEdition>();
            songs = new HashSet<Song>();
        }

        [Key]
        [StringLength(255)]
        public string code { get; set; }

        [Required]
        [StringLength(255)]
        public string artist { get; set; }

        [Required]
        [StringLength(255)]
        public string title { get; set; }

        public int diameter { get; set; }

        [Required]
        [StringLength(255)]
        public string cover { get; set; }

        [Required]
        [StringLength(255)]
        public string full_cover { get; set; }

        public bool vault { get; set; }

        [Column(TypeName = "date")]
        public DateTime release_date { get; set; }

        [Required]
        [StringLength(255)]
        public string series { get; set; }

        [Required]
        [StringLength(255)]
        public string store_link { get; set; }

        [Required]
        [StringLength(255)]
        public string spotify_link { get; set; }

        public virtual Artist artist1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RecordCredit> record_credits { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RecordEdition> record_editions { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Song> songs { get; set; }
    }
}
