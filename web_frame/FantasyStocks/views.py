from django.shortcuts import render, HttpResponse

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

def login(request):
    return render(request, 'FantasyStocks/login.html')

def home(request):
    return render(request, 'FantasyStocks/home.html')

def forum(request):
    return render(request, 'FantasyStocks/forum.html')
