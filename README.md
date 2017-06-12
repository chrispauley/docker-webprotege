# Docker Image for WebProtégé v3.0.0-dev

This image uses tomcat:8.0-jre8.

Usage:
```sh
docker run -d -p 8080:8080 christophbe/webprotege:v3.0.0-dev
```

The startup may take some time. After it has finished you can access WebProtégé at <http://localhost:8080/>. Make sure port 8080 is not used by another service of the host system (otherwise map to a non occupied port). ***Be sure to connect the container to an existing MongoDB instance!***

---
**WebProtégé reference:**
*Tudorache, Tania, Csongor Nyulas, Natalya F. Noy, and Mark A. Musen. "WebProtégé: A collaborative ontology editor and knowledge acquisition tool for the web." Semantic web 4, no. 1 (2013): 89-99.*
