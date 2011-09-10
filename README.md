# ConsoleFM #
This gem grabs tracks and their sources from [][console.fm] and gives them back
in an array. It also lets you see valid genres and check strings against that
list of genres. Think of it as a really ghetto API, since they won't let me make
one for them anyway. :D 

## Installation ##

`gem isntall consolefm`

## Usage ##

'''ruby
require "consolefm"

#get the genres
ConsoleFM.genres

#grab the tracks from the 'minimal' genre
ConsoleFM.tracks "minimal"

#or grab the top songs on the site right now
ConsoleFM.tracks "top"
```

And that's about it.

## Rate Limiting and Hinderances ##

There's no rate limiting, yet.

Sometimes the server will return various 400 errors if you want to download the tracks.
This will depend soley on how a lonely farmer on the west coast of Norway is feeling at 
that precise nanosecond. There is nothing you can do but send this farmer love letters, 
chocolate and use the following code block to ensure smooth operation:

```ruby
f = File.new sanitized_track_name, "a+"
begin
	#need open-uri to read from http
	data = open(track_url).read
	f.syswrite data
	f.close
rescue Exception => e
	puts e.message
	f.close #handle is still open. close it!
	File.delete sanitized_track_name #otherwise we have a 0-byte file
end
```
## License ##

This gem is under BSD but [][console.fm] has their own terms. I would follow them.