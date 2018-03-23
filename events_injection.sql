use events;

/*drop table attendees;
insert into attendees(name)
values 
("Edwin"),
("Chris"),
("Thomas");*/

/*insert into presentations(name, location, presentation_time)
values
("Software Design", "San Antonio", "2018-04-01 12:00:00"),
("Software Manipulation", "Chicago", "2018-04-02 12:00:00"),
("Application Theory","New York", "2018-04-03 12:00:00");
*/

/*insert into attendee_presentation(attendee_id,presentation_id)
values (1,1),(2,2),(3,3);*/

select presentation.name, attendees.name,location from presentations join attendee_presentations on attendee_presentation.attendee_id = attendees,id where attendees.name = "edwin";

select presentations.name as "Presentation Name", attendees.name,location
  from presentations
  join attendee_presentation
    on attendee_presentation.presentation_id = presentations.id
  join attendees
    on attendee_presentation.attendee_id = attendees.id
 where attendees.name                    = "edwin ";


select presentations.name as "Presentation Name", attendees.name,location
  from presentations
  join attendee_presentation
    on attendee_presentation.presentation_id = presentations.id
  join attendees
    on attendee_presentation.attendee_id = attendees.id;
