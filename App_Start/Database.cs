using System.Data.SqlClient;
using System;
using System.Configuration;


namespace MTN
{
    public class Database
    {

        public Database()
        { }

        public void Insert_user(string firstName, string lastName, string userName, string city, string email,
            string password, string job, string sex, string dob, string phoneNumber, string address, string title)
        {
            using (var Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mtndb"].ConnectionString))
            {
                Conn.Open();
                if (email == null) email = " ";
                if (address == null) address = " ";
                var commandText =
                    $"INSERT INTO Users(FirstName, LastName, UserName, City, Email, Password, Job, Sex, Dob, PhoneNumber, address) values('{firstName}', '{lastName}', '{userName}', '{city}', '{email}', '{password}', '{job}', '{sex}', '{dob}', '{phoneNumber}', '{address}');";
                var command = new SqlCommand(commandText, Conn);
                command.ExecuteNonQuery();
                commandText = $"INSERT INTO Payments(UserId) values('{Get_user_data(null, userName)[0]}')";
                command = new SqlCommand(commandText, Conn);
                command.ExecuteNonQuery();
            }
        }

        public string[] Get_user_data(int? id, string userName = null)
        {
            string[] data = new string[13];
            using (var Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mtndb"].ConnectionString))
            {
                Conn.Open();
                string commandText = "";
                if (userName != null)
                    commandText = $"SELECT * from Users where UserName = '{userName}';";
                else commandText = $"SELECT * from Users where Id = {id};";

                var cmd = new SqlCommand(commandText, Conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    for (int i = 0; i < 13; i++)
                        data[i] = reader.GetValue(i).ToString();
            }
            return data;
        }

        public void Update_user_data(string id, string firstName, string lastName, string city,
            string job, string sex, string dob, string title, string address)
        {
            using (var Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mtndb"].ConnectionString))
            {
                Conn.Open();
                var commandText = "UPDATE Users SET " +
                                  ((firstName != null) ? $"FirstName = '{firstName}'," : "") +
                                  ((lastName != null) ? $"LastName = '{lastName}'," : "") +
                                  ((city != null) ? $"City = '{city}'," : "") +
                                  ((job != null) ? $"Job = '{job}'," : "") +
                                  ((dob != null) ? $"Dob = '{dob}'," : "") +
                                  ((title != null) ? $"title = '{title}'," : "") +
                                  ((address != null) ? $"address = '{address}'" : "") +
                                  $"WHERE Id = {id};";
                var command = new SqlCommand(commandText, Conn);
                command.ExecuteNonQuery();
            }
        }

        public bool Check_user_login(string userName, string password)
        {
            using (var Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mtndb"].ConnectionString))
            {
                Conn.Open();
                var command = new SqlCommand($"SELECT Password from Users WHERE UserName = @userName", Conn);
                SqlParameter param = new SqlParameter();
                param.ParameterName = "@userName";
                param.Value = userName;
                command.Parameters.Add(param);
                var reader = command.ExecuteReader();
                if (!reader.HasRows) return false;
                while (reader.Read())
                    return reader.GetString(0) == password;
            }
            return false;
        }

        public void Add_payment(string UserId, string Amount, string done)
        {
            using (var Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mtndb"].ConnectionString))
            {
                Conn.Open();
                var commandText =
                 $"INSERT INTO Payments(UserId, Amount, Date, Done) values('{UserId}', '{Amount}', '{DateTime.Now.ToString("dd-MM-yyyy")}', '{done}');";
                var command = new SqlCommand(commandText, Conn);
                command.ExecuteNonQuery();
            }
        }

        public string[,] Get_payments(string UserId, string number)
        {
            string[,] payments = new string[10, 5];
            using (var Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mtndb"].ConnectionString))
            {
                Conn.Open();
                var commandText =
                 $"SELECT * from Payments where UserId = {UserId} and Number = '{number}' and Done= 'no';";
                var command = new SqlCommand(commandText, Conn);
                SqlDataReader reader = command.ExecuteReader();
                int c = 0;
                while (reader.Read())
                {
                    if (c > 10)
                        break;
                    for (int i = 0; i < 5; i++)
                        payments[c, i] = reader.GetValue(i).ToString();
                    c++;
                }
            }
            return payments;
        }

        public string[,] Get_done_payments(string UserId, string number)
        {
            string[,] payments = new string[10, 5];
            using (var Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mtndb"].ConnectionString))
            {
                Conn.Open();
                var commandText =
                 $"SELECT * from Payments where UserId = {UserId} and Number = '{number}' and Done = 'yes';";
                var command = new SqlCommand(commandText, Conn);
                SqlDataReader reader = command.ExecuteReader();
                int c = 0;
                while (reader.Read())
                {
                    if (c > 10)
                        break;
                    for (int i = 0; i < 5; i++)
                        payments[c, i] = reader.GetValue(i).ToString();
                    c++;
                }
            }
            return payments;
        }

        public void Add_number(string id, string number)
        {
            using (var Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mtndb"].ConnectionString))
            {
                Conn.Open();
                var commandText = $"UPDATE Users SET PhoneNumber += ',{number}'" +
                                  $"WHERE Id = {id};";
                var command = new SqlCommand(commandText, Conn);
                command.ExecuteNonQuery();
            }
        }

        public string[,] Get_Payments()
        {
            string[,] payments = new string[10, 6];
            using (var Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mtndb"].ConnectionString))
            {
                Conn.Open();
                var commandText =
                 $"SELECT * from Payments where Done = 'no';";
                var command = new SqlCommand(commandText, Conn);
                SqlDataReader reader = command.ExecuteReader();
                int c = 0;
                while (reader.Read())
                {
                    string[] userData;
                    var Db = new Database();
                    if (c > 10)
                        break;
                    for (int i = 0; i < 6; i++)
                        if (i == 1)
                        {
                            userData = Db.Get_user_data(int.Parse(reader.GetValue(i).ToString()), null);
                            payments[c, i] = $"{userData[3]} {userData[4]} -{userData[0]}";
                        }
                        else payments[c, i] = reader.GetValue(i).ToString();
                    c++;
                }
            }
            return payments;
        }

        public string[,] GetUsers()
        {
            string[,] users;
            using (var Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mtndb"].ConnectionString))
            {
                Conn.Open();
                var commandText = $"select count(*) from users";
                var command = new SqlCommand(commandText, Conn);
                users = new string[(int)command.ExecuteScalar(), 12];

                commandText = $"SELECT * from users;";
                command = new SqlCommand(commandText, Conn);
                SqlDataReader reader = command.ExecuteReader();
                int c = 0;
                while (reader.Read())
                {
                    var Db = new Database();
                    for (int i = 0; i < 12; i++)
                        users[c, i] = reader.GetValue(i).ToString();
                    c++;
                }
            }
            return users;
        }
    }
}