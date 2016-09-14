from urllib.parse import quote_plus
from django import template

def urlify(value):
    return quote_plus(value)

register = template.Library()
register.filter('urlify',urlify)
