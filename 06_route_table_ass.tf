resource "aws_route_table_association" "company_rtass_a" {
  subnet_id      = aws_subnet.company_weba.id
  route_table_id = aws_route_table.company_rt.id

}

resource "aws_route_table_association" "company_rtass_c" {
  subnet_id      = aws_subnet.company_webc.id
  route_table_id = aws_route_table.company_rt.id

}
