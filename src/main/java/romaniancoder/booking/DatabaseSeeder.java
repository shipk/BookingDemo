package romaniancoder.booking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class DatabaseSeeder implements CommandLineRunner {
    private BookingRepository bookingRepository;

    @Autowired
    public DatabaseSeeder(BookingRepository bookingRepository){
        this.bookingRepository = bookingRepository;
    }

    @Override
    public void run(String... strings) throws Exception {
        List<HotelBooking> bookings = new ArrayList<>();

        bookings.add(new HotelBooking("Marriot", 200.50, 3));
        bookings.add(new HotelBooking("Ibis", 90, 4));
        bookings.add(new HotelBooking("Novotel", 140.74, 1));
        bookings.add(new HotelBooking("Hilton", 1009.4, 5));
        bookings.add(new HotelBooking("Holiday Inn", 50.0, 1));
        bookings.add(new HotelBooking("Violet", 16.0, 1));
        bookings.add(new HotelBooking("Sparrow1", 16.0, 1));
        //bookings.add(new HotelBooking("Sparrow2", 16.0, 1));

        bookingRepository.save(bookings);
    }
}
