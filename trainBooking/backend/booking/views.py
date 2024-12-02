from rest_framework import viewsets
from .models import Train, Booking, Seat, Coach, BookingSeat
from .serializer import TrainSerializer, BookingSerializer, SeatSerializer, BookingSeatSerializer, CoachSerializer
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.utils.dateparse import parse_date
import os
from django.conf import settings
from datetime import datetime
from django.contrib.auth.models import User
from decimal import Decimal
from django.shortcuts import get_object_or_404

class TrainViewSet(viewsets.ModelViewSet):
    queryset = Train.objects.all()
    serializer_class = TrainSerializer

class BookingViewSet(viewsets.ModelViewSet):
    queryset = Booking.objects.all()
    serializer_class = BookingSerializer

class SeatViewSet(viewsets.ModelViewSet):
    queryset  = Seat.objects.all()
    serializer_class = SeatSerializer

class CoachViewSet(viewsets.ModelViewSet):
    queryset = Coach.objects.all()
    serializer_class = CoachSerializer

class BookingSeatViewSet(viewsets.ModelViewSet):
    queryset = Coach.objects.all()
    serializer_class = BookingSeatSerializer

def writeLog(message):
    log_dir = os.path.join(settings.BASE_DIR, 'log')
    log_file_path = os.path.join(log_dir, 'log.txt')

    if not os.path.exists(log_dir):
        os.makedirs(log_dir)

    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    with open(log_file_path, 'a') as log_file:
        log_file.write(f"{timestamp} - {message}\n")
    

@api_view(['GET'])
def check_train_availability(request):
    destination = request.GET.get('destination')
    departure_date = request.GET.get('departure_date')
    return_date = request.GET.get('return_date')

    if departure_date: 
        try:
            departure_date = datetime.strptime(departure_date, '%Y-%m-%d').date()
        except ValueError:
            writeLog("Invalid departure date format")
            departure_date = None

    if return_date: 
        try:
            return_date = datetime.strptime(return_date, '%Y-%m-%d').date()
        except ValueError:
            writeLog("Invalid return date format")
            return_date = None

    trains = Train.objects.all()

    if destination and departure_date and return_date:
        trains = trains.filter(destination=destination, departure_time__date=departure_date, return_time__date=return_date)
    else:
        writeLog("No train found matching the criteria")
        return Response(status=404)
    
    if trains:
        serializer = TrainSerializer(trains, many=True)
        return Response(serializer.data)
    else:
        writeLog("No train found matching the criteria")
        return Response(status=404)



@api_view(['GET'])
def get_coaches(request, train_id):
    try:
        train = Train.objects.get(id=train_id)
    except Train.DoesNotExist:
        return Response({'detail' : 'Train not found'}, status=404)
    
    coaches = Coach.objects.filter(train=train)
    # seats = Seat.objects.filter(coach__in=coaches)

    coach_serializer = CoachSerializer(coaches, many=True)
    # seat_serializer = SeatSerializer(seats, many=True)

    return Response({
        'coaches': coach_serializer.data,
        
    })

@api_view(['GET'])
def get_seat(request, coach_id):
    try:
        coach = Coach.objects.get(id=coach_id)
    except Coach.DoesNotExist:
        return Response({'detail' : 'Coach not found'}, status=404)
    
    seat = Seat.objects.filter(coach=coach)

    seats_serializer = SeatSerializer(seat, many=True)

    return Response({
        'seats' : seats_serializer.data,
    })

@api_view(['POST'])
def confirm_booking(request):
    data = request.data

    try:
        selected_seat_ids = data.get('selectedSeat', [])
        selected_coach_id = data.get('selectedCoach')
        selected_train_id = data.get('selectedTrain')
        num_of_pax = data.get('numOfPax')
        amount = data.get('amount')
        userId = data.get('userId')

    except KeyError as e:
        writeLog(f"Missing key in booking data: {e}")
        return Response({'error' : 'Invalid booking data'}, status=viewsets.HTTP_400_BAD_REQUEST)
    
    if not (selected_seat_ids and selected_coach_id and selected_train_id):
        writeLog('Incomplete booking data')
        return Response({'error' : 'incomplete booking data'}, status = viewsets.HTTP_400_BAD_REQUEST)
    
    try:
        user = User.objects.get(id=userId)
    except User.DoesNotExist:
        return Response({"error": "User not found."}, status=404)
    
    try:
        train = Train.objects.get(id=selected_train_id)
    except Train.DoesNotExist:
        return Response({"error": "Train not found."}, status=404)

    amount = Decimal(amount)
    total_amount = num_of_pax * amount

    booking = Booking.objects.create(
        train = train,
        user = user,
        booking_date = datetime.now(),
        total_amount = total_amount,
        status = "pending payment"
    )

    seat = Seat.objects.filter(id__in=selected_seat_ids)
    seat.update(is_available=False)


    for seat_id in selected_seat_ids:
        try:
            seat = Seat.objects.get(id=seat_id)
            BookingSeat.objects.create(
                booking = booking,
                seat = seat,
                status = "booked"
            )
        except BookingSeat.DoesNotExist:
            writeLog(f"Seat with ID {seat_id} not found in coach")

    try: 
        booking_id = booking.id
        booking = Booking.objects.get(id=booking_id)
        booking_serializer = BookingSerializer(booking)
    except Booking.DoesNotExist:
        return Response({'detail': 'Booking not found'}, status=viewsets.HTTP_404_NOT_FOUND)
    
    writeLog("Booking confirmed Successfully")
    return Response({'message' : 'Booking confirmed successfully',
                     'booking': booking_serializer.data}, status=201)


@api_view(['POST'])
def confirm_payment(request, booking_id):
    writeLog("test payment")
    try:
            booking = Booking.objects.get(id=booking_id)
            booking.status = 'paid'
            booking.save()
            return Response({'message': 'Payment confirmed and booking status updated to paid.'}, status=200)
    except Booking.DoesNotExist:
            return Response({'error': 'Booking not found.'}, status=viewsets.HTTP_404_NOT_FOUND)


    
