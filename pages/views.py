from django.shortcuts import render
from django.shortcuts import render
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from main.models import *

QUESTIONS_PER_PAGE = 12


def aboutPageView(request):
    return render(request, 'about.html', {'current_user': request.user})

def searchView(request):
    return render(request, 'search.html', {'current_user': request.user})
