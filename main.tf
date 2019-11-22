//initialize the provider
provider "aws"{
        access_key = "AKIATBE2HRQUIZYUNBND"
        secret_key = "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"
        region = "${var.region}"
}

data "aws_caller_identity" "current" {
  
//auto-accept peering connection
}
resource "aws_vpc_peering_connection" "primary2secondary" {
  peer_owner_id = "${data.aws_caller_identity.current.account_id}"
  peer_vpc_id = "${aws_vpc.secondary.id}"
  vpc_id = "${aws_vpc.primary.id}"
  auto_accept=true
}
//Route Table

resource "aws_route" "primary2secondary" {
  route_table_id = "${aws_vpc.primary.main_route_table_id}"
  destination_cidr_block = "${aws_vpc.secondary.cidr_block}"
vpc_peering_connection_id = "${aws_vpc_peering_connection.primary2secondary.id}"
}
resource "aws_route" "secondary2primary" {
  route_table_id = "${aws_vpc.secondary.main_route_table_id}"
  destination_cidr_block = "${aws_vpc.primary.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.primary2secondary.id}"  
}


