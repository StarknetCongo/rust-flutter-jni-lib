use std::os::raw::c_char;
use std::ffi::CString;

pub fn add(left: usize, right: usize) -> usize {
    left + right
}

#[no_mangle]
pub extern "C" fn hello_world() -> *mut c_char{
    CString::new("Hello, world from RUST!").unwrap().into_raw()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
