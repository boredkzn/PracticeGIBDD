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
    
    public partial class StatusHistory
    {
        public int Id { get; set; }
        public int IdLicence { get; set; }
        public string Comment { get; set; }
        public System.DateTime DateChange { get; set; }
        public int OldStatus { get; set; }
        public int NewStatus { get; set; }
    
        public virtual Licences Licences { get; set; }
    }
}
