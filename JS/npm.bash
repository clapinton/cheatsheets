npm init --yes #Initializes an app with NPM by generating a boilerplate package.json.
npm install --save <package_name1 package_name2> #Installs and lists a NPM package as a dependency in a package.json.
npm install --save-dev <package_name> #Same for dev env
npm install #Downloads all JavaScript dependencies listed in a package.json.

On package.json, add the following to "scripts" to allow for npm run <pkg> to run
the version we inteded.
    "webpack": "webpack"
