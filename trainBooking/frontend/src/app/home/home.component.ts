import { Component, OnInit } from '@angular/core';
import { homeService }  from '../home.service';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class homeComponent implements OnInit {
  trains : any[] = [];
  checkForm: FormGroup;
  availableTrains: any[] =[];

  constructor(private fb: FormBuilder, private homeService: homeService, private router: Router, private authService: AuthService) {
    this.checkForm = this.fb.group({
      destination: [''],
      departure_date: [''],
      return_date: [''],
      numOfPax: [1]
    });
  }

  ngOnInit(): void {
    this.homeService.getTrains().subscribe((data) => {
      this.trains = data;
    })
  }

  onSubmit() {
    const { destination, departure_date, return_date, numOfPax } = this.checkForm.value;

    this.homeService.checkTrainAvailability(destination, departure_date, return_date)
    .subscribe(
      response => {
        alert('Train available');
          this.router.navigate(['/booking'], {
            state: { availableTrains: response, numOfPax: numOfPax } // Pass numOfPax in state
          });
        },
        error => alert('Train unavailable. Please select another destination, departure date or return date')
      
    );
  }

  logout(){
    this.authService.logout();
  }

}