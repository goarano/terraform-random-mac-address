resource "random_id" "address_bytes" {
  byte_length = 6
}

# https://serverfault.com/a/40720
resource "random_shuffle" "second_char" {
  input        = ["2", "6", "A", "E"]
  result_count = 1
}

resource "terraform_data" "mac_address" {
  input = upper(
    format("%s%s:%s:%s:%s:%s:%s",
      substr(random_id.address_bytes.hex, 0, 1),
      random_shuffle.second_char.result[0],
      substr(random_id.address_bytes.hex, 1, 2),
      substr(random_id.address_bytes.hex, 3, 2),
      substr(random_id.address_bytes.hex, 5, 2),
      substr(random_id.address_bytes.hex, 7, 2),
      substr(random_id.address_bytes.hex, 9, 2),
    )
  )
}

resource "terraform_data" "interface_name" {
  input = lower(
    format("enx%s%s%s",
      substr(random_id.address_bytes.hex, 0, 1),
      random_shuffle.second_char.result[0],
      substr(random_id.address_bytes.hex, 1, 10),
    )
  )
}
