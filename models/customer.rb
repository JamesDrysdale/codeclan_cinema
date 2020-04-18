require_relative("../db/sql_runner")

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"].to_i
  end

  # CREATE
  def save()
    sql = "INSERT INTO customers
        (
            name,
            funds
        )
        VALUES
        (
            $1, $2
        )
        RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  # READ
  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return Customer.map_items(customers)
  end


  def self.map_items(customer_data)
    result = customer_data.map { |customer| Customer.new(customer) }
    return result
  end

  # UPDATE
  def update()
    sql = "UPDATE customers SET name = $1, funds = $2 WHERE id $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  # DELETE

    def self.delete_all()
      sql = "DELETE FROM customers"
      SqlRunner.run(sql)
    end 

    def delete()
      sql = "DELETE FROM customers WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end 

    def films()
      sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
      values = [@id]
      film_data = SqlRunner.run(sql,values)
      return Film.map_items(film_data)
    end

  






    # # How many film tickets has a customer bought?
    # def tickets_count()
    #     sql = " SELECT films.*
    #         FROM films
    #         INNER JOIN tickets
    #         ON tickets.film_id = films.id
    #         WHERE customer_id = $1
    #         ORDER BY films.title ASC;
    #         "
    #     values = [@id]
    #     films = SqlRunner.run(sql, values)
    #     return Film.map_items(films).length()
    # end

    # def tickets()
    #     sql = "SELECT * FROM tickets where customer_id = $1"
    #     values = [@id]
    #     ticket_data = SqlRunner.run(sql, values)
    #     return ticket_data.map { |ticket| Ticket.new(ticket) }
    # end

    

end