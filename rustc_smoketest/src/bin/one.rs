#![feature(lang_items)]
#![allow(internal_features)]
#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]            #[no_mangle] pub fn panic(_info: &PanicInfo) -> ! { loop {} }
#[lang = "eh_personality"]  #[no_mangle] pub extern fn eh_personality() {}

#[no_mangle]
pub unsafe extern "C" fn main() -> i32 {
    return 1;
}