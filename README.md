## Green Lean Electrics Dashboard
This repository contains all the necessary code to build and deploy the web application used to show GLE's prosumer and manager web interfaces. A copy of this website is deployed right now at [green-lean.web.app](https://green-lean.web.app) under a Firebase Hosting plan. It is advised to use the site with Google Chrome.

### Deploy process
##### Requirements
- Flutter toolchain installed and ready, including web support of the beta channel
- A local webserver software, such as Python's `SimpleHTTPServer`
- Access to a proper configured GLE backend. If you want to use your own deployment of the GLE's backend, please replace the original backend URI (`pure-badlands-64215.herokuapp.com/`) with the URI of yours. This can be easily achieved with the bulk rename tool of a code editor such as VSCode
##### Alternatives
If you want to avoid installing the Flutter toolchain, it is possible to build the web app by executing the first task of the included GitHub action. The resulting output will be uploaded as an artifact.

##### Build and deploy steps
1. Build the app

```sh
$ cd PATH_TO_PROJECT
$ flutter pub get
$ flutter build web --release
```
2. Launch it locally
```sh
$ cd build/web
$ python -m SimpleHTTPServer 8000  
```

After this steps, a running version of the web app will be accesible at `http://localhost:8000`
