def obtain_xpath_gender_selector(gender):
    return "//select[@name='gender']/option[text()='" + gender + "']"

def obtain_xpath_confirmation_legend(email):
    return "//p[contains(.,'Hemos enviado un correo de confirmación a la dirección') and contains(.,'" + email + "') and contains(.,'Te pedimos por favor que revises y des clic en el botón') and contains(.,'para concluir con el registro de tu cuenta.')]"

def obtain_xpath_confirmation_sent_email_legend(email):
    return "//p[contains(.,'Hemos enviado un correo a la dirección') and contains(.,'" + email + "') and contains(.,'con un link') and contains(.,'para la recuperación de tu contraseña.')]"

def obtain_xpath_email_unregistered(email):
    return "//div[contains(.,'El correo " + email + " no está registrado')]"