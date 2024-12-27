locals {
  math       = 2 * 2                        #Math Operator *,/,-,+
  equality   = 2 != 2                       #Equality Operator ==,!=
  comparison = 2 < 1                        # comparison >,<,>=,<=
  logical    = true && false                #logical Operator &&,||,!
  list       = [for i in [2, 3, 4] : i * 2] #List Comprehension
}

output "Operator" {
  value = {
    equality   = local.equality
    comparison = local.comparison
    logical    = local.logical
    list       = local.list
    math       = local.math
  }
}