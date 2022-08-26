resource "aws_route_table_association" "company_rtnass_wasa" {
  subnet_id      = aws_subnet.company_wasa.id
  route_table_id = aws_route_table.company_natrt.id
}

resource "aws_route_table_association" "company_rtnass_wasc" {
  subnet_id      = aws_subnet.company_wasc.id
  route_table_id = aws_route_table.company_natrt.id
}

resource "aws_route_table_association" "company_rtnass_dba" {
  subnet_id      = aws_subnet.company_dba.id
  route_table_id = aws_route_table.company_natrt.id
}

resource "aws_route_table_association" "company_rtnass_dbc" {
  subnet_id      = aws_subnet.company_dbc.id
  route_table_id = aws_route_table.company_natrt.id
}
