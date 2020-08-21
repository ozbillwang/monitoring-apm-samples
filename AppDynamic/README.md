# Sample java application (tomcat) with java agent (AppDynamic)

### Usage

* update your own details to ARGS in `Dockerfile`

* run the application

```
docker-compose up -d
```

* access the application

http://localhost:8888/SampleWebApp/

`Click to Invoke a SnoopServlet` to generate traffic

* login your AppDynamic account to review your application, there should be a new applicaiton called `demo` and you can go thorough its metric now. 
