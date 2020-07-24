# Sample java application (tomcat) with java agent (New Relic)

### Usage

* update license key in `Dockerfile`

* run the application

```
docker-compose up -d
```

* access the application

http://localhost:8888/SampleWebApp/

`Click to Invoke a SnoopServlet` to generate traffic

* login https://one.newrelic.com/ to review your application in New Relic APM, there should be a new applicaiton called `demo` and you can go thorough its metric now. 
