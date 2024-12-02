import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { RegisterComponent} from './register/register.component';
import { homeComponent } from './home/home.component';
import { BookingComponent } from './booking/booking.component';
import { DetailsComponent } from './details/details.component';
import { AuthGuard } from './auth.guard';
import {BookingSummaryComponent } from './booking-summary/booking-summary.component';

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent},
  {path: 'home', component: homeComponent, canActivate: [AuthGuard]},
  { path: '', redirectTo: 'login', pathMatch: 'full'},
  { path: 'login', redirectTo: 'login'},
  // { path: 'home', redirectTo: 'home'},
  { path: 'booking', component: BookingComponent },
  { path: 'details', component: DetailsComponent },
  { path: 'booking-summary', component: BookingSummaryComponent}
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
