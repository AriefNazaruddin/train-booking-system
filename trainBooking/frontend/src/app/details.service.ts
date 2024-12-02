import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable} from 'rxjs'

@Injectable({
  providedIn: 'root'
})
export class DetailsService {

  private apiUrl = 'http://127.0.0.1:8000/api/booking'
  constructor(private http: HttpClient) { }

  confirmBooking(data: any):Observable<any>{
    return this.http.post(`${this.apiUrl}/confirmBooking/`, data);
  }


  confirmPayment(bookingId: number): Observable<any>{
    return this.http.post<any>(`${this.apiUrl}/confirmPayment/${bookingId}/`, {});
  }
}
