import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DetailsService } from '../details.service';

@Component({
  selector: 'app-details',
  templateUrl: './details.component.html',
  styleUrl: './details.component.css'
})
export class DetailsComponent implements OnInit {
  selectedSeat: any[] = [];
  selectedCoach: any = null;
  selectedTrain: any = null;
  numOfPax: number = 1;
  destination: string = '';
  departure_date: string = '';
  return_date: string = ''
  amount: number = 0;

  constructor(private router: Router, private detailsService: DetailsService)
  {
    const navigation = this.router.getCurrentNavigation();
    const state = navigation?.extras?.state as {
      selectedSeat: any[];
      selectedCoach: any;
      selectedTrain: any;
      numOfPax: number;
      destination: string;
      departure_date: string;
      return_date: string;
      amount: number;
    };

    if(state)
    {
      this.selectedSeat = state.selectedSeat
      this.selectedCoach = state.selectedCoach
      this.selectedTrain = state.selectedTrain
      this.numOfPax = state.numOfPax
      this.destination = state.destination
      this.departure_date = state.departure_date
      this.return_date = state.return_date
      this.amount = state.amount
    }
  }

  ngOnInit(): void {
    console.log(this.selectedSeat, this.selectedCoach, this.selectedTrain);
  }

  confirmBooking(): void{
    const userId = localStorage.getItem('authToken');
    const seatIds = this.selectedSeat.map(seat => seat.id);
    
    const bookingData = {
      selectedSeat:  seatIds,
      selectedCoach: this.selectedCoach.id,
      selectedTrain: this.selectedTrain.id,
      numOfPax: this.numOfPax,
      amount: this.amount,
      userId: userId
    };

    console.log(bookingData);

    this.detailsService.confirmBooking(bookingData).subscribe(
      response => {
        alert('Booking confirmed!');
        this.router.navigate(['/booking-summary'], {state: {response}});
      },
      error => {
        alert(error.message);
        console.log(error);
      }
    )
  }
}
