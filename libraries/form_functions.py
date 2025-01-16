import random
from datetime import datetime, timedelta
from unidecode import unidecode

first_names = [
    "Itzel", "Guadalupe", "Esther", "Liliana", "Marisol", "Lorena", "Sol", "Jenifer", "Samuel", "Clara",
    "Juan", "María", "Pedro", "Ana", "Luis", "Carmen", "José", "Laura", "Carlos", "Elena",
    "Miguel", "Lucía", "Francisco", "Marta", "Antonio", "Isabel", "Manuel", "Sofía", "Javier", "Paula",
    "David", "Sara", "Jorge", "Clara", "Raúl", "Teresa", "Alberto", "Rosa", "Fernando", "Patricia",
    "Sergio", "Julia", "Ricardo", "Irene", "Andrés", "Beatriz", "Adrián", "Cristina", "Pablo", "Silvia"
]

last_names = [
    "Zabala", "Gualtero", "Galán", "Galván", "Diaz", "Angeles", "Alvira", "Valderrama", "Corrales", "Enríquez", 
    "García", "Martínez", "Rodríguez", "López", "González", "Pérez", "Sánchez", "Ramírez", "Torres", "Flores",
    "Hernández", "Ruiz", "Aragon", "Moreno", "Álvarez", "Muñoz", "Romero", "Ortiz", "Gutiérrez", "Jiménez",
    "Molina", "Castro", "Vargas", "Ramos", "Santos", "Cruz", "Ortega", "Reyes", "Chávez", "Rojas",
    "Mendoza", "Guerrero", "Vega", "Delgado", "Pena", "Aguilar", "Castillo", "Cabrera", "Luna", "Campos"
]

genders = ["Masculino", "Femenino", "Otro", "Prefiero no decirlo"]

domains = ["example.com", "test.com", "mail.com", "email.com", "yopmail.com", "gmail.com", "hotmail.com"]

def generate_random_name():
    first_name = random.choice(first_names)
    return first_name

def generate_random_last_name():
    last_name = random.choice(last_names)
    return last_name

def generate_random_gender():
    gender = random.choice(genders)
    return gender

def generate_random_date(start_year=1950, end_year=datetime.now().year):
    start_date = datetime(start_year, 1, 1)
    end_date = datetime(end_year, 12, 31)
    random_days = random.randint(0, (end_date - start_date).days)
    random_date = start_date + timedelta(days=random_days)
    return random_date.strftime("%d/%m/%Y")

def generate_random_phone_number():
    phone_number = ''.join(random.choices('0123456789', k=10))
    return phone_number

def generate_random_email(first_name, last_name):
    # I preferred to use the name and surname previously selected so that the test seems more real
    # but we could use a random first and last name
    # first_name = random.choice(first_names)
    # last_name = random.choice(last_names)
    first_name = unidecode(first_name).lower()
    last_name = unidecode(last_name).lower()
    domain = random.choice(domains)
    email = f"{first_name}.{last_name}{random.randint(1, 100)}@{domain}"
    return email
