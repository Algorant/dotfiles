// Verdigris Rust sample
// Check keywords, types, lifetimes, macros, strings, numbers, and diagnostics-like TODOs.

use std::{collections::HashMap, fmt::Display};

#[derive(Debug, Clone)]
pub struct Garden<'a> {
    name: &'a str,
    plants: HashMap<String, u32>,
    watered: bool,
}

impl<'a> Garden<'a> {
    pub fn new(name: &'a str) -> Self {
        Self {
            name,
            plants: HashMap::new(),
            watered: false,
        }
    }

    pub fn plant<T: Display>(&mut self, label: T, count: u32) -> Result<(), String> {
        if count == 0 {
            return Err("count must be greater than zero".to_string());
        }

        self.plants.insert(label.to_string(), count);
        Ok(())
    }

    pub fn water(&mut self) {
        self.watered = true;
        println!("Watered garden: {}", self.name);
    }
}

fn main() -> Result<(), String> {
    let mut garden = Garden::new("moss hollow");
    garden.plant("fern", 12)?;
    garden.plant("blue sage", 7)?;
    garden.water();

    // TODO: tune warning/error contrast against the theme palette.
    dbg!(&garden);
    Ok(())
}
