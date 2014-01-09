def self.arrange list, group_size   
  number_of_groups = list.length / group_size

  groups = []

  1.upto(number_of_groups).each do |group_num|
    groups << list.pop(group_size)
  end

  remainder = list.length % group_size

  if remainder > 0
    groups[-1] = groups[-1] + list.pop(remainder)
  end

  groups
end


def self.arrange2 list, group_size
  groups = list.each_slice(group_size).to_a

  if groups.last.length < group_size
    last = groups.pop
    groups[-1] += last
  end
  groups
end