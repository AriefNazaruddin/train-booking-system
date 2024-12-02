import { Component, OnInit } from '@angular/core';
import { Router, NavigationExtras } from '@angular/router';
import { homeService } from '../home.service';

@Component({
  selector: 'app-booking',
  templateUrl: './booking.component.html',
  styleUrl: './booking.component.css'
})
export class BookingComponent {
  availableTrains: any[] = [];
  selectedTrains : any = null;
  availableCoaches: any[] = [];
  availableSeats: any[] = [];
  trainSelected: boolean = false;
  selectedCoach: any = null;
  selectedSeat: any[] = [];
  numOfPax: number = 0;

  constructor(private router: Router, private homeService : homeService){
    const navigation = this.router.getCurrentNavigation();
    const state = navigation?.extras?.state as { availableTrains: any[], numOfPax: number }; 
    if (state?.availableTrains)
    {
      this.availableTrains = state.availableTrains;
      this.numOfPax = state.numOfPax;
      console.log(this.numOfPax);
    }
  }


  ngOnInit(): void{
    console.log(this.availableTrains);
  }

  selectTrain(train: any): void 
  {
    this.selectTrain = train;
    this.trainSelected = true;
    this.selectedTrains = train;

    this.homeService.getCoaches(train.id).subscribe(
      (data) =>{
        this.availableCoaches = data.coaches;
      },
      error => {
        alert('Error fetching coaches');
      }
    );
  }

  selectCoach(coach: any): void
  {
    this.selectedCoach = coach;
    
    console.log(coach);
    console.log(this.selectedCoach);
    this.homeService.getSeat(coach.id).subscribe(
      (data) =>{
        this.availableSeats = data.seats;
        console.log(coach.id);
      },
      error =>{
        alert('Error fetching seat');
      }
    )
  }

  selectSeat(seat: any) {
    if (seat.is_available) {
      const Index = this.selectedSeat.findIndex(s => s.id === seat.id);
      if (Index === -1) {
        console.log(this.numOfPax  + "this.numOfPax");
        if(this.selectedSeat.length < this.numOfPax){
          this.selectedSeat.push(seat);
        }
        else
        {
          alert(`You can only select up to ${this.numOfPax} seats.`);
        }
      } else {
        this.selectedSeat.splice(Index, 1); // Deselect if already selected
      }
    }
  }

  isSeatSelected(seat: any): boolean {
    return this.selectedSeat.some(s => s.id === seat.id);
  }

  proceedToDetails()
  {
    this.router.navigate(['/details'], {
      state: {
        selectedSeat: this.selectedSeat,
        selectedCoach: this.selectedCoach,
        selectedTrain: this.selectedTrains,
        numOfPax: this.numOfPax,
        destination: this.selectedTrains.destination,
        departure_date: this.selectedTrains.departure_time,
        return_date: this.selectedTrains.return_time,
        amount: this.selectedTrains.amount

      }
    });
    console.log(this.selectedSeat);
  }
}
