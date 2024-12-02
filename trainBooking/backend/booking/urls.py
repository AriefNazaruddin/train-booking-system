from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register(r'trains', views.TrainViewSet)
router.register(r'coaches', views.CoachViewSet)
router.register(r'seats', views.SeatViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('check-availability/', views.check_train_availability, name='check_train_availability'),
    path('coaches/<int:train_id>', views.get_coaches, name='get_coaches'),
    path('seat/<int:coach_id>', views.get_seat, name='get_seats'),
    path('confirmBooking/', views.confirm_booking, name='confirmBooking'),
    path('confirmPayment/<int:booking_id>/', views.confirm_payment, name='confirmPayment')
]