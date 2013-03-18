define platform_services::validate_var {
  unless getvar("::${name}") {
    fail("must provide top-scope variable '\$$name'")
  }
}
