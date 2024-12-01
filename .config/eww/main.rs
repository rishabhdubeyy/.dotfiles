// main.rs
use eww::{eww_client, widget::Widget};

fn main() {
    // Initialize the EWW client
    let mut eww = eww_client::eww_client();

    loop {
        // Update positions based on the current time
        let now = chrono::Utc::now();
        let seconds = now.num_seconds_from_midnight() as f64;

        // Calculate positions
        let sun_x = 150.0 + 100.0 * f64::cos(seconds / 60.0 * 2.0 * std::f64::consts::PI);
        let earth_x = sun_x + 50.0 * f64::cos(seconds / 30.0 * 2.0 * std::f64::consts::PI);
        let moon_x = earth_x + 20.0 * f64::cos(seconds / 15.0 * 2.0 * std::f64::consts::PI);

        // Update the widget positions
        eww.update("sun", "x", sun_x as i32);
        eww.update("earth", "x", earth_x as i32);
        eww.update("moon", "x", moon_x as i32);

        // Sleep for a short duration to reduce CPU usage
        std::thread::sleep(std::time::Duration::from_millis(100));
    }
}
