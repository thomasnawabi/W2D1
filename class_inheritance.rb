
require 'byebug'
class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary.to_i
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  # def total_salary(employees)
  #   total = 0
  #   employees.each do |employee|
  #     total += employee.salary
  #   end
  # end
#
#
end

class Manager < Employee

  attr_accessor :subordinates
  def initialize(name, title, salary, boss, subordinates)
    super(name, title, salary, boss)
    @subordinates = subordinates
  end


  def bonus(multiplier)
    sum = 0
    self.subordinates.each do |subordinate|
      if subordinate.class == Manager
        sum += subordinate.bonus(multiplier) + subordinate.salary * multiplier
      else
        sum += subordinate.bonus(multiplier)
      end
    end

    sum
  end

end

# (((dav + shawna) * multi) + darren) * multi
# (dav * multi + shawn * multi + darren) * multi


if __FILE__ == $PROGRAM_NAME
  # for all subordinates, if the subordinate is a regular employee, just add their `bonus` to the sum
  # but if the subordinate is a manager add that manager's salary times multi) plus their `bonus` to the sum
  shawna = Employee.new('Shawna', 'TA', 12000, 'Darren')
  david = Employee.new('David', 'TA', 10000, 'Darren')
  darren = Manager.new('Darren', 'TA Manager', 78000, 'Ned', [shawna, david])
  ned = Manager.new('Ned', 'Founder', 1000000, nil, [darren])

  # (s_salary + d_salary) * bonus_multiplier
  # (s_salary * bonus_multiplier) + (d_salary * bonus_multiplier)
  # p ned.subordinates
# p darren.bonus(4) # => 88_000
# p david.bonus(3) # => 30_000
p ned.bonus(5) # => 500_000
p darren.bonus(4)
end
