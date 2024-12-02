from django.db import models
from django.contrib.auth.models import User

class Train(models.Model):
    train_number = models.CharField(max_length=10, unique=True)
    departure_time = models.DateTimeField()
    return_time = models.DateTimeField()
    destination = models.CharField(max_length=255)
    amount = models.DecimalField(max_digits=5, decimal_places=2)
    

class Coach(models.Model):
    train = models.ForeignKey(Train, on_delete=models.CASCADE, related_name="coaches")
    coach_number = models.CharField(max_length=5)

class Seat(models.Model):
    coach = models.ForeignKey(Coach, on_delete=models.CASCADE, related_name="seats")
    seat_number = models.CharField(max_length=5)
    is_available = models.BooleanField(default=True)

class Booking(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='bookings')
    train = models.ForeignKey(Train, on_delete=models.CASCADE, related_name="bookings")
    booking_date = models.DateTimeField(auto_now_add=True)
    total_amount = models.DecimalField(max_digits=5, decimal_places=2)
    status = models.CharField(max_length=50)

class BookingSeat(models.Model):
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE)
    seat = models.ForeignKey(Seat, on_delete=models.CASCADE)
    status = models.CharField(max_length=50)
    
