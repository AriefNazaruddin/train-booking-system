import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

interface home {
  id: number;
  train_number: string;
  destination: string;
  departure_time: string;
  arrival_time: string;
}

@Injectable({
  providedIn: 'root'
})
export class homeService {
  private apiUrl = 'http://127.0.0.1:8000/api/booking';

  constructor(private http: HttpClient){}

  getTrains():Observable<home[]>{
    return this.http.get<home[]>(`${this.apiUrl}/trains/`);
  }

  checkTrainAvailability(destination: string, departure_date:string, return_date: string) : Observable<any[]>{
    const params = new HttpParams()
    .set('destination', destination)
    .set('departure_date', departure_date)
    .set('return_date', return_date)

    return this.http.get<any[]>(`${this.apiUrl}/check-availability/`, {params})
  }

  getCoaches(trainId: number): Observable<any> 
  {
    return this.http.get(`${this.apiUrl}/coaches/${trainId}`);
  }

  getSeat(coachId: number) : Observable<any>
  {
    return this.http.get(`${this.apiUrl}/seat/${coachId}`);
  }

}