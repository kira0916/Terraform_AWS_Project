resource "aws_route_table_association" "hychai_rtnass_wasa" {
  subnet_id      = aws_subnet.hychai_wasa.id
  route_table_id = aws_route_table.hychai_natrt.id
}

resource "aws_route_table_association" "hychai_rtnass_wasc" {
  subnet_id      = aws_subnet.hychai_wasc.id
  route_table_id = aws_route_table.hychai_natrt.id
}

resource "aws_route_table_association" "hychai_rtnass_dba" {
  subnet_id      = aws_subnet.hychai_dba.id
  route_table_id = aws_route_table.hychai_natrt.id
}

resource "aws_route_table_association" "hychai_rtnass_dbc" {
  subnet_id      = aws_subnet.hychai_dbc.id
  route_table_id = aws_route_table.hychai_natrt.id
}
