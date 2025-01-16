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
En la carpeta tests se encuentran diferentes casos de prueba automatizados, el archivo login/login_test.robot contiene diferentes test cases automatizados referente a la página de login del sitio de Chilango (https://login.chilango.com), en el archivo home/home_test.robot contiene diferentes test cases automatizados referente al home page del sitio de Chilango (https://www.chilango.com)
