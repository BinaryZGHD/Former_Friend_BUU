var attentionsitems = ['', 'คอมพิวเตอร์ ', 'ครู', 'ประกันภัย', 'สถิติ'];
var attentionsvalue = '';
var statusitems = ['', 'ศึกษาต่อ', 'ว่างงาน', 'มีงานทำ'];
var statusvalue = '';
var jobtypeitems = ['', '1', '2', '3'];
var jobtypevalue = '';

Map<String, Map<String, Object>> screeninfo = {
"head": {
"status": "200",
"message": "susccess",
"module": "Home"
},
"body": {
"screeninfo": {
"titleprofile": " Profile  ",
"subtitlegeninfor": " General information  ",
"subtitlecont": " Contact  ",
"subtitleeduinfo": " Education information  ",
"subtitleaddress": " Address  ",
"subtitleworkinfo": " Career  ",
"textedit": " Edit  ",
"textsave": " Save  ",
"textname": " Name  ",
"textlname": " Lastname  ",
"textnickname": " Nickname  ",
"textstdcode": " Student code  ",
"textgen": " Generation  ",
"texttel": " Tel  ",
"textfac": " Faculty  ",
"textdepart": " Department  ",
"textmajor": " Major  ",
"textgpaju": " GPA (Junior high school)  ",
"textgpase": " GPA (Senior high school)  ",
"textgpaba": " GPA (Bachelor degree)  ",
"subtitleworkplace": " Work place  ",
"textcomp": " Company  ",
"textatt": " Attention  ",
"textcareer": " Career  ",
"textJobtype": " Job type   ",
"textemp": " Employed  ",
"textunemp": " Unemployed  ",
"textfustud": " Futher study  ",
"textstudying": " Studying  "
},
"profile_general_info": {
"name": " Name  ",
"surname": " Surname  ",
"nickname": " Nickname  ",
"stu_code": " XX03XXXX ",
"gen": " 65  ",
"tel": "0123456789"
},
"profile_edu_info": {
"faculty": " Science  ",
"department": " Mathematics  ",
"major": " Math  ",
"gpa_bd": " 4.00 ",
"gpa_jhs": "4.00",
"gpa_shs": "4.00"
},
"profile_address_info": {
"number": "156/4",
"village" :"-",
"road": "-",
"subdistrict" : "-",
"district": "-",
"province" :"-",
"zipcode" : "12345"

},

"profile_contact_info": {
"phone": "156/4",
"line" :"-",
"fackbook": "-",
"instagrm" : "-",
"twitter": "-",
"youtube" : "-"

},
"profile_career_info": {
"attention": [
{
"id": "1",
"attenname": "attention1"
},
{
"id": "2",
"attenname": "attention2"
}
],
"status": [
{
"id": "1",
"statusname": "status1"
},
{
"id": "2",
"statusname": "status2"
}
],
"jobtype": [
{
"id": "1",
"jobname": "job1"
},
{
"id": "2",
"jobname": "job2"
}
]

}
}
};