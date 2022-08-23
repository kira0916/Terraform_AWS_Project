resource "aws_db_subnet_group" "company_dbsg" {
    name = "company-dbsg"
    subnet_ids = [aws_subnet.company_dba.id, aws_subnet.company_dbc.id]
}

resource "aws_db_instance" "company_mydb" {
    allocated_storage = 20
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "5.7.34"
    instance_class = "db.t2.micro"
    db_name = "db"
    identifier = "db"
    username = "root"
    password = "It1234567!"
    parameter_group_name = "korea"
    availability_zone = "ap-northeast-2a"
    db_subnet_group_name = aws_db_subnet_group.company_dbsg.id
    vpc_security_group_ids = [aws_security_group.company_sec.id]
    skip_final_snapshot = true
    tags = {
        "Name" = "company-db"
    }
}
