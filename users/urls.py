from django.urls import path
from .views import  *

# router links
urlpatterns = [
    path('register/', register, name='register'),
    path('logout/', logout_view, name='logout'),
    path('login/', login_view, name='login'),
]