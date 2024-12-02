from rest_framework import serializers
from .models import Train, Coach, Seat, Booking, BookingSeat
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']

class TrainSerializer(serializers.ModelSerializer):
    class Meta:
        model = Train
        fields = ['id', 'train_number', 'departure_time', 'return_time', 'destination', 'amount']

class CoachSerializer(serializers.ModelSerializer):
    class Meta:
        model = Coach
        fields = ['id', 'coach_number', 'train']

class SeatSerializer(serializers.ModelSerializer):
    coach = CoachSerializer(read_only=True)  

    class Meta:
        model = Seat
        fields = ['id', 'seat_number', 'is_available', 'coach']

class BookingSeatSerializer(serializers.ModelSerializer):
    seat = SeatSerializer(read_only=True) 

    class Meta:
        model = BookingSeat
        fields = ['id', 'status', 'seat']

class BookingSerializer(serializers.ModelSerializer):
    train = TrainSerializer(read_only=True)
    user = UserSerializer(read_only=True)
    booking_seats = BookingSeatSerializer(source='bookingseat_set', many=True, read_only=True)  # Include BookingSeats

    class Meta:
        model = Booking
        fields = ['id', 'user', 'booking_date', 'train', 'booking_seats', 'total_amount']
