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
    
    public partial class CarColors
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CarColors()
        {
            this.Licences = new HashSet<Licences>();
        }
    
        public int ColorNum { get; set; }
        public string ColorCode { get; set; }
        public string Name { get; set; }
        public string ColorName { get; set; }
        public string IsMettalic { get; set; }
        public string NameEN { get; set; }
        public string ColorNameEN { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Licences> Licences { get; set; }
    }
}
