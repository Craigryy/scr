""" Production specific settings."""
from .base import *

# Parse database configuration from $DATABASE_URL
import dj_database_url

ALLOWED_HOSTS = ['*']

DEBUG = False

SITE_ID = 1

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_USE_TLS = True

# Database
# https://docs.djangoproject.com/en/1.11/ref/settings/#databases

DATABASES = {}

DATABASES['default'] = dj_database_url.config(conn_max_age=600, ssl_require=False)

STORAGES = {
    "default": {
        "BACKEND": "django.core.files.storage.FileSystemStorage",
    },
    "staticfiles": {
        "BACKEND": "whitenoise.storage.CompressedManifestStaticFilesStorage",
    },
}

# Ensure STATIC_ROOT exists.
os.makedirs(STATIC_ROOT, exist_ok=True)

# https://docs.djangoproject.com/en/2.1/ref/settings/#secure-proxy-ssl-header
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
