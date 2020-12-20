import os


def populate_global_settings(g):
    # NOTE: this file is private, but that's studying project so fuck it

    g["SECRET_KEY"] = "emmth&)#dqep)_uc@i@$xy8&+1l7dt()vb7ji!szuel+2%1vn*"
    g["ALLOWED_HOSTS"].append("*")

    # g["DATABASES"]["default"]["HOST"] = "{{ db_host }}" or "127.0.0.1"
    g["DATABASES"] = {
        "default": {
            "ENGINE": "django.db.backends.sqlite3",
            "NAME": g["BASE_DIR"] / "db.sqlite3",
        }
    }
