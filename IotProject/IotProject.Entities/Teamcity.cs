using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IotProject.Entities
{
    public class Teamcity
    {
        [Key,DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string branch_name { get; set; }
        public string branch_display_name { get; set; }
        public string branch_is_default { get; set; }
        public string build_start_time { get; set; }
        public string timestamp { get; set; }
        public string build_event { get; set; }
        public string build_name { get; set; }
        public string build_status_url { get; set; }
        public string build_number { get; set; }
        public string triggered_by { get; set; }
        public string build_result { get; set; }
        public string build_result_previous { get; set; }
        public string build_result_delta { get; set; }
    }
}
