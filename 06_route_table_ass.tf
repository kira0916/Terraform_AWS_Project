resource "aws_route_table_association" "hychai_rtass_a" {
  subnet_id      = aws_subnet.hychai_weba.id
  route_table_id = aws_route_table.hychai_rt.id

}

resource "aws_route_table_association" "hychai_rtass_c" {
  subnet_id      = aws_subnet.hychai_webc.id
  route_table_id = aws_route_table.hychai_rt.id

}
