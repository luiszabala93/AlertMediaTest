# Alert Media Test | Technical Interview
Test suite developed by Luis Zabala
This repository is an automated mini test suite in RobotFramework + Selenium + Python from the Chilango news site, it was made as an exercise for a technical interview for Alert Media.

## Create a virtual enviroment

Use the package vevn library and pip function.

```bash
python -m venv venv
```

## Activate virtual environment

```python
source venv/Scripts/activate
```

## Set up
Once the virtual environment is active, it is necessary to install all the required libraries as follows:
```bash
pip install -r requirements.txt
```
After installing the libraries, copy the "fitz" folder located in the "resources" folder and replace it in the "venv/Lib/site-packages" location

## Test Suite
In the tests folder there are different automated test cases, the login/login_test.robot file contains different automated test cases referring to the login page of the Chilango site (https://login.chilango.com), the home/home_test.robot file contains different automated test cases referring to the home page of the Chilango site (https://www.chilango.com)

To run automated login tests from Chrome without generating a report, you can use:
```bash
robot -d results -i LOG -v ENVIRONMENT:PROD -v REPORT:FALSE -v BROWSER:chrome .
```

If you want to use another browser, for example Edge, you just have to change:
```bash
robot -d results -i LOG -v ENVIRONMENT:PROD -v REPORT:FALSE -v BROWSER:edge .
```

If you want to run only one specific test and generate the pdf report, you can use:
```bash
robot -d results -i LOG_06 -v ENVIRONMENT:PROD -v REPORT:TRUE -v BROWSER:chrome .
```

The generated report will be saved in results/test_cases_evidence/PROD/login

## Parallelism with Pabot

If the user wants to run test cases in parallel, pabot can be used, for this we execute the following line of code:
```bash
pabot --testlevelsplit --processes 4 -d results -i HOM -v ENVIRONMENT:PROD -v REPORT:FALSE -v BROWSER:chrome .
```
The number of test cases that you want to run in parallel is limited by the number of cores that the computer has, and can be indicated in the following section:
```bash
pabot --testlevelsplit --processes {number}
```
