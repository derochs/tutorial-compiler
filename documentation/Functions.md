## Functions 
The following functions are already implemented:
* installDevonfwIde
* restoreDevonfwIde
* installCobiGen
* cobiGenJava
* createDevon4jProject
* buildJava
* createFile
* changeFile
* createFolder
* cloneRepository
* runServerJava
* buildNg
* npmInstall
* downloadFile
* nextKatacodaStep

***

### installDevonfwIde
#### parameter
1. The tools you want to install within the devonfw ide: string array
2. Optional: The version of the ide to install
#### example
installDevonfwIde(["java","mvn"], "2020.08.001")

***

### restoreDevonfwIde
#### parameter
1. The tools you want to install within the devonfw ide: string array
2. Optional: The version of the ide to install
#### example
restoreDevonfwIde(["java","mvn"], "2020.08.001")
#### details 
In the Katacoda environment the installation of the devonfw IDE is executed in a startup script.
***

### installCobiGen
#### parameter
* No parameters
#### example
installCobiGen()

***

### cobiGenJava
#### parameter
1. The path to the java file you want to generate code for: string
2. The numbers that represent the templates that CobiGen uses to generate code: int array
#### example
cobiGenJava("path/to/java/file/MyEntity.java",[1,3,5,6,8])
### details
| Number | Description |
| --- | -- |
| 1 | CRUD logic: Generates the logic layer and implementations for some use cases.|
| 3 | CRUD REST services: Generates the service layer with CRUD operations for using in REST services.|
| 5 | TO's: Generates the related Transfer Objects.|
| 6 | Entity infrastructure: Creates the entity main interface and edits (by a merge) the current entity to extend the newly generated classes.|
| 8 | CRUD SpringData Repository: Generates the entity repository (that contains the CRUD operations) in the data access layer.

***

### createDevon4jProject
#### parameter 
1. The project name
#### example 
createDevon4jProject("cobigenexample")

***

### buildJava
#### parameter 
1. The project directory
2. (Optional) Indicator whether tests should be run. Default is false.
#### example 
buildJava("cobigenexample", true)

***

### createFile
#### parameter 
1. Path of the file to be created (relative path to the workspace directory)
2. (Optional) Path of the file to get the content from. Relative to the playbook directory
#### example 
createFile("cobigenexample/core/src/main/java/com/example/application/cobigenexample/customermanagement/dataaccess/api/CustomerEntity.java", "files/CustomerEntity.java")

***

### changeFile
#### parameter 
1. Path of the file to be changed (relative path to the workspace directory)
2. 
 *  Path of the file to get the content from or a string, that should be inserted.
 * (Optional) Name of a placeholder 
#### example 
changeFile("cobigenexample/core/src/main/java/com/example/application/cobigenexample/customermanagement/dataaccess/api/CustomerEntity.java", { "file": "files/Placeholder.java", "placeholder": "private static final long serialVersionUID = 1L;" })
#### details
##### Path of the file to get the content from or a string, that should be inserted.
If you want to add content from a file: 
{"file": "[path]"}
If you want to add a string to a file: 
{"content": "[string]"}
If you want to add different contents for the katacoda and console runner, then use the properties "fileConsole" and "fileKatacoda" or "contentConsole" and "contentKatacoda":
{"fileConsole": "[pathToConsoleFile]", "fileKatacoda": "[pathToKatacodaFile]"}
##### Name of the placeholder
If you want to insert content into your code between two existing lines, take the previous line as your placeholder. Add your placeholder into the new file or string, otherwise it will be replaced entirely.

example:{...,"placeholder": "private int age;"}
| Before | Content or File | After |
| --- | --- | --- |
|<p>private int age;<br><br>public String getFirstname() {<br>return firstname;<br>}<br></p>|<p>private int age;<br><br>private String company;<br>public String getCompany() {<br>return firstname;<br>}<br>public void setCompany(String company) {<br>this.company = company;<br>}</p>|<p>private int age;<br><br>private String company;<br>public String getCompany() {<br>return firstname;<br>}<br>public void setCompany(String company) {<br>this.company = company;<br><br>public String getFirstname() {<br>return firstname;<br>}<br></p>|

A placeholder is optional. If you do not define a placeholder, the content in the existing file will be simply replaced by the new content.

Please try not to use custom placeholders. Keep in mind that you might want to build the project before changing them. Custom placeholders with a comment-syntax (e.g. "//PLACEHOLDER") will be removed by the console-environment and others might cause errors.

***

### createFolder
#### parameter 
1. Path of the folder to be created, relative to the workspace directory. Subdirectories are also created.
#### example 
createFolder("directoryPath/subDirectory")

***

### cloneRepository
#### parameter 
1. Path into which the repository is to be cloned, relative to workspace.
2. Git repository URL
#### example 
cloneRepository("", "https://github.com/devonfw-forge/tutorial-compiler.git")
Repository will be cloned directly into the workspace directory.

cloneRepository("devonfw-forge", "https://github.com/devonfw-forge/tutorial-compiler.git")
Repository will be cloned into a newly created subdirectory devonfw-forge.

***


### runServerJava
#### parameter 
1. Path to the server directory within the java project.
2. Assertion information. Only needed for the console runner to check if the server was started properly.
#### example 
runServerJava("devonfw/workspaces/main/jump-the-queue/java/jtqj/server", { "startupTime": 40, "port": 8081, "path": "jumpthequeue" })

##### Assertion information
startupTime = Time in seconds to wait before checking if the server is running
port: Port on which the server is running
path: The URL path on which is checked if the server is running

***

### npmInstall
#### parameter 
1. Path to the project where the dependencies from the package.json file are to be installed.
#### example 
npmInstall("my-thai-star/angular")

***

### downloadFile
#### parameter 
1. URL of the file to be downloaded.
2. Name of file.
3. (Optional) Downloads file to a given directory relative to workspace. Directory is created, if its not existing.
#### example 
downloadFile("https://bit.ly/2BCkFa9", "file", "downloads")

***

### buildNg
#### parameter 
1. Path to the angular project relative to workspace
2. (Optional) Custom output directory.
#### example 
buildNg("exampleAngularProject")
Will build the angular project to default output directory defined in angular.json outputPath key, normally set to dist/.

buildNg("exampleAngularProject", "testOutput")
Will build the angular project to output directory testOutput.

***

### runClientNg
#### parameter 
1. Path to the angular project from which the frontend server is to be started.
2. Assertion information. Only needed for the console runner to check if the server was started properly.
#### example 
runClientNg("jump-the-queue/angular", { "startupTime": 200, "port": 4200, "path": "" })

##### Assertion information
startupTime = Time in seconds to wait before checking if the server is running
port: Port on which the server is running
path: The URL path on which is checked if the server is running

***

### nextKatacodaStep
#### parameter
1. The title of the step.
2. An array of json objects with files, content, or images to be rendered within the katacoda step.
#### example 
nextKatacodaStep("Step title", [{ "file": "files/description.md" }, { "content": "This is just plain content." }, { "image": "files/image.png" }])

#### Details
Available attributes in the json objects:

file: Path to a file whose content is to be displayed in the katacoda step (e.g. .md or .txt file).
content: Plain text to be displayed in the katacoda step.
image: Path to an image to be displayed in the katacoda step.

***
