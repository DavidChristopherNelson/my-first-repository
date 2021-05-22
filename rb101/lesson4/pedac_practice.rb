=begin 

1000_lights
Understand the Problem
  There is a bank of switches containing n switches, each 
  wired to a unique light. They are all initially off. You 
  walk down and switch them all on. Then you walk down and 
  toggle every second one. Then you walk down and toggle 
  every third one. You keep doing this until you have been 
  through n repetitions. 
  
  
  input: an integer representing the total number of switches
  output: an array containing the positions of the lights that
    are on. 
  rules: 
    Explicit requirements
      - switches contain two states on or off and are 
        initially off.
      - switches are numbered according to their position.
        That is switch five is the fifth switch. Switch 
        numbers start at one.
    Inplicit requirements
      - return an empty array if no lights are on. 
  
  Questons: 
    - Will I be given 0 or negative integers as input? 

Test Cases
  These test cases must return true
  light_switch_bank(5) == [1, 4]
  light_switch_bank(10) == [1, 4, 9]
  
Data Structure 
  - Switches have binary states, on or off, so I will represent 
    them with a boolean data structure. 
  - Switch banks will be represented in an array. 

Algorithm 
  - initialize an array called switch_bank.
  - populate the array with false. 
  - loop through the array
    - Check if switch should be toggled **More detail shown 
      below**
    - Toggle the switch
  - end loop
  - repeat the above loop increasing the interval between 
    switches
  - stop repeating when the loop interval is larger than the
    switch_bank array.
  
  - initialize the return array called on_switches
  - loop through the switch_bank array
    - if value is true append index to on_switches
  - end loop
  
  - return array
  
  **
  - if switch index modulo switch interval is zero then 
    toggle the switch
=end

def light_switch_bank(number_switches) 
  switch_bank = []
  number_switches.times {switch_bank << false}
  interval_between_switches = 1
  while interval_between_switches <= switch_bank.size
    switch_bank.each_index do |switch_index|
      if (switch_index + 1) % interval_between_switches == 0
        switch_bank[switch_index] = !switch_bank[switch_index]
      end
    end
    interval_between_switches += 1
  end
  
  on_switches = []
  switch_bank.each_index do |switch_index|
    if switch_bank[switch_index] == true
      on_switches << switch_index + 1
    end
  end
  on_switches
end


p light_switch_bank(1000) 
