## Setup

```bundle```

```rake db:setup```

Specs and be run

```rails test```


### post /devices

example post body

```
{
	"device": {
		"user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0)",
		"uuid_fingerprint": "b6f6555386c9aaa5ef6f204ee828da8d",
		"language": "Python",
		"screen_height": 1234,
		"screen_width": 1234,
		"time_zone" : "America/Lima",
		"local_storage": false,
		"session_storage": false,
		"cookies" : false,
		"indexed_db": false,
		"platform": "Mac",
		"mobile": false
		"plugins": ["list of plugins"],
		"touch_support": {"touch_action": true},
		"app_bundle_id": 41.96,
 		"app_version": "19.86",
 		"model": "ALGOL

	}

}

```
