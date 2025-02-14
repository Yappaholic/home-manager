fn main() {
    let option = std::env::args().nth(1).expect("no option given");
    match option.as_str() {
        "help" => println!("A way to print date, use `clock date` or 'clock time'"),
        "time" => get_time("time"),
        "date" => get_time("date"),
        _ => print!(""),
    }
}

fn get_time(call: &str) {
    let mut child = std::process::Command::new("date");
    if call == "date" {
        child.arg("+%a, %b %d");
    } else if call == "time" {
        child.arg("+%I:%M %p");
    } else {
        child.args([""]);
    };
    let output = child
        .spawn()
        .expect("could not launch process")
        .wait_with_output()
        .expect("can't get stdout")
        .stdout;
    let result = String::from_utf8(output).expect("error occured");

    print!("{}", result.trim())
}
