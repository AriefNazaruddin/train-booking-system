import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DetailsService} from '../details.service';

@Component({
  selector: 'app-booking-summary',
  templateUrl: './booking-summary.component.html',
  styleUrl: './booking-summary.component.css'
})
export class BookingSummaryComponent implements OnInit {
  bookingDetails: any;

  constructor(private router: Router, private detailsService: DetailsService)
  {
    const navigation = this.router.getCurrentNavigation();
    this.bookingDetails = navigation?.extras?.state?.['response'];
  }

  ngOnInit(): void{
    console.log(this.bookingDetails)
  }

  confirmPayment(): void{
    const bookingId = this.bookingDetails.booking.id;
    this.detailsService.confirmPayment(bookingId).subscribe(
      response => {
        alert('Payment confirmed!.');
        this.router.navigate(['/home']);
      },
      error => {
        alert('Error confirming payment: ' + error.message);
      }
    )
  }
}
