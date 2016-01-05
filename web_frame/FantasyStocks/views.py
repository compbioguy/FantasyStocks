from django.shortcuts import render

def login(request):
    return render(request, 'FantasyStocks/login.html')

def home(request):
    return render(request, 'FantasyStocks/home.html')

def forum(request):
    return render(request, 'FantasyStocks/forum.html')
