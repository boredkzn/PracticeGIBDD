//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PracticeGIBDD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Drivers
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Drivers()
        {
            this.DTP_Driver = new HashSet<DTP_Driver>();
            this.Licences = new HashSet<Licences>();
            this.Fine = new HashSet<Fine>();
        }
    
        public Guid IdGuid { get; set; }

        [Required]
        public string Name { get; set; }
        [Required]
        public string Surname { get; set; }
        [Required]
        public string Middlename { get; set; }
        [Required]
        public int PassportSerial { get; set; }
        [Required]
        public int PassportNumber { get; set; }

        private string _passport;
        public string Passport
        {
            get => PassportSerial.ToString() + " " + PassportNumber.ToString();
            set => _passport = value;
        }

        public int Postcode { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string AddressLife { get; set; }
        public string Company { get; set; }
        public string Jobname { get; set; }
        [Required]
        public string Phone { get; set; }
        [Required]
        public string Email { get; set; }

        private string photoLala;

        public string nameMiddle => Name + " " + Middlename;

        public string SecondSer => Name + " " + Surname + " " + Middlename;
        [Required]
        public string Photo {
            get => photoLala.Contains(@":") ? photoLala : @"C:\Users\79196\Source\Repos\boredkzn\PracticeGIBDD\PracticeGIBDD\PracticeGIBDD\Resources\" + photoLala;
            set => photoLala = value; 
        }
        public string Description { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DTP_Driver> DTP_Driver { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Licences> Licences { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Fine> Fine { get; set; }
    }
}
