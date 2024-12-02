import { Component } from '@angular/core';
import { AuthService } from '../auth.service'

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent {
  username: string = '';
  email: string = '';
  password: string = '';
  confirmPassword: string = '';

  constructor(private authService : AuthService) {}

  onSubmit() {
    this.authService.register(this.username, this.email, this.password, this.confirmPassword).subscribe(
      response => alert('Registration successful: ' +  response),
      error => alert('Registration failed: ' + error)
    );
  }

}
