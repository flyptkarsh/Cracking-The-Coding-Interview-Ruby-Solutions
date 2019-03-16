# 8.6 Towers of Hanoi
def construct_board(n)
  @towers = [[*1..n].reverse,[], []]
end

def move(num_disks, start=0, target=1, using=2)
  if num_disks == 1
    @towers[target] << @towers[start].pop
    p "Moved disk from #{start} to #{target}: #{@towers}"
  else
    move(num_disks - 1, start, using, target)
    move(1, start, target, using)
    move(num_disks - 1, using, target, start)
  end
end

construct_board(5)
