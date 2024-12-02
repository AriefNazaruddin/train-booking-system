import { TestBed } from '@angular/core/testing';

import { BookingSummaryService } from './booking-summary.service';

describe('BookingSummaryService', () => {
  let service: BookingSummaryService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(BookingSummaryService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
