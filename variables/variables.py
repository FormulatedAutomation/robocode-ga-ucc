'''
Variables for Robot Framework goes here.
'''
import calendar
from datetime import date

from RPA.Robocloud.Secrets import Secrets

WEEK_DAY_NAME = calendar.day_name[date.today().weekday()]

secrets = Secrets()
GA_UCC_USERNAME = secrets.get_secret("ga_ucc_creds")["username"]
GA_UCC_PASSWORD = secrets.get_secret("ga_ucc_creds")["password"]