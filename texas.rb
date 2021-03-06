#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'pp'

cards_json = File.read('cards.json')
CARDS_HASH = JSON.parse(cards_json)
all_cards = %w{ 
            id1 id2 id3 id4 id5 id6 id7 id8 id9 id10 id11 id12 id13
            id21 id22 id23 id24 id25 id26 id27 id28 id29 id30 id31 id32 id33
            id41 id42 id43 id44 id45 id46 id47 id48 id49 id50 id51 id52 id53
            id61 id62 id63 id64 id65 id66 id67 id68 id69 id70 id71 id72 id73
            }
all_cards.shuffle!
player_a = []
player_b = []
player_c = []

5.downto(1) { 
    player_a << all_cards.shift
    player_b << all_cards.shift
    player_c << all_cards.shift
}

my_cards = Hash.new {|hash,key| hash[key] = [] }
my_colors = []
#my_cards[:spade] = []
#my_cards[:heart] = []
#my_cards[:club] = []
#my_cards[:diamond] = []
#my_cards[:joke] = []
player_a = ['id42', 'id21', 'id3', 'id4', 'id5', 'id6', 'id7']
player_a.each_with_index do |item, index|
    puts "#{index} : #{CARDS_HASH[item]}"
    puts "sort cards by num"
    case CARDS_HASH[item]['num']
    when 1
        my_cards[:num01] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 2
        my_cards[:num02] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 3
        my_cards[:num03] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 4
        my_cards[:num04] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 5
        my_cards[:num05] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 6
        my_cards[:num06] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 7
        my_cards[:num07] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 8
        my_cards[:num08] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 9
        my_cards[:num09] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 10
        my_cards[:num10] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 11
        my_cards[:num11] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 12
        my_cards[:num12] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    when 13
        my_cards[:num13] << CARDS_HASH[item]['color']
        my_colors << CARDS_HASH[item]['color']
    else 
        #puts 'joke'
        #puts CARDS_HASH[item]['num']
        my_cards[:joke] << CARDS_HASH[item]['color']
        #p my_cards[:joke]
    end
end
puts '==============='
pp my_cards
pp my_colors.uniq.count
puts '==============='
kind = ''
nums = my_cards.keys.sort
pp nums
if my_cards[nums[0]] == my_cards[nums[1]] 
    puts "true"
end

if nums.count == 7 # straight_flush, flush, straight, high_card
    if my_colors.uniq.count == 1
        
        #if nums[6][-2,2].to_i - nums[3][-2,2].to_i == 3 and nums[0] == 1
        #    puts "royal_straight nums[0]"
        #end


        [6,5,4].each { |i|
            if nums[i][-2,2].to_i - nums[i - 4][-2,2].to_i == 4
                puts "straight_flush #{nums[i]}"
            end
        }

    end
        if nums[6][-2,2].to_i - nums[6 - 4][-2,2].to_i == 4
            puts "straight_flush #{nums[6]}"
        else
            puts "nothing"
        end
end

if nums.count == 5
    if nums[4][-2,2].to_i - nums[0][-2,2].to_i == 4 
        flush = 1
        1.upto(4) do |id|
            if my_cards[nums[0]] != my_cards[nums[id]]
                flush = 0
                break
            end
        end

        if flush == 1
            kind = 'stright_flush'
            puts kind
        else
            kind = 'stright'
            puts kind
        end
    else
        kind = 'single'
        puts kind
    end
end

if nums.count == 4
    kind = 'pair'
    puts kind
    my_cards.each_key do |key|
        puts 'pair'.key[-2,2]  if my_cards[key].to_a.count == 2
    end
end

if nums.count == 3
    #Todo 2 pair + 1 or 1 three + 1 + 1
    my_cards[nums[id]]
end

if nums.count == 2

    kind = '4of1kind'
    puts kind
end



def kinds_of cards
    # stright flush and flush
    kind = ''
    if nums.count == 5
        if nums[4][-2,2].to_i - nums[0][-2,2].to_i == 4 
            flush = 1
            1.upto(4) do |id|
                if my_cards[nums[0]] != my_cards[nums[id]]
                    flush = 0
                    break
                end
            end

            if flush == 1
                kind = 'stright_flush'
                puts kind
            else
                kind = 'stright'
                puts kind
            end
        end
    end
end


def play_cards
    puts "please start game!"
end

def show_cards player
    player.each_with_index do |item, index|
        puts "#{index} : #{CARDS_HASH[item]}]"
    end
end

def select_card *args
    # TODO
end

def sort_by_color player
    cards_of = Hash.new {|hash,key| hash[key] = [] }
    player.each_with_index do |item, index|
        puts "#{index} : #{CARDS_HASH[item]}"
        puts "sort cards by color"
        case CARDS_HASH[item]['color']
        when 'spade'
            cards_of[:spade] << CARDS_HASH[item]['num']
        when 'heart'
            cards_of[:heart] << CARDS_HASH[item]['num']
        when 'club'
            cards_of[:club] << CARDS_HASH[item]['num']
        when 'diamond'
            cards_of[:diamond] << CARDS_HASH[item]['num']
        else 
            #puts 'joke'
            #puts CARDS_HASH[item]['num']
            cards_of[:joke] << CARDS_HASH[item]['num']
            #p my_cards[:joke]
        end
    end
    cards_of.each_key {|key| hand_cards[key].sort! }
    p cards_of
end

def sort_by_num player
    cards_of = Hash.new {|hash,key| hash[key] = [] }
    player.each_with_index do |item, index|
        puts "#{index} : #{CARDS_HASH[item]}"
        puts "sort cards by num"
        case CARDS_HASH[item]['num']
        when 1
            cards_of[:num1] << CARDS_HASH[item]['color']
        when 2
            cards_of[:num2] << CARDS_HASH[item]['color']
        when 3
            cards_of[:num3] << CARDS_HASH[item]['color']
        when 4
            cards_of[:num4] << CARDS_HASH[item]['color']
        when 5
            cards_of[:num5] << CARDS_HASH[item]['color']
        when 6
            cards_of[:num6] << CARDS_HASH[item]['color']
        when 7
            cards_of[:num7] << CARDS_HASH[item]['color']
        when 8
            cards_of[:num8] << CARDS_HASH[item]['color']
        when 9
            cards_of[:num9] << CARDS_HASH[item]['color']
        when 10
            cards_of[:num10] << CARDS_HASH[item]['color']
        when 11
            cards_of[:num11] << CARDS_HASH[item]['color']
        when 12
            cards_of[:num12] << CARDS_HASH[item]['color']
        when 13
            cards_of[:num13] << CARDS_HASH[item]['color']
        else 
            #puts 'joke'
            #puts CARDS_HASH[item]['num']
            cards_of[:joke] << CARDS_HASH[item]['color']
            #p my_cards[:joke]
        end
    end
    cards_of.each_key {|key| hand_cards[key].sort! }
    p cards_of
end

def cmp_single *args
    # TODO
end

def cmp_pair *args
    # TODO
end

def cmp_2pair *args
    # TODO
end

def cmp_3of1kind *args
end

def cmp_straight *args
    # TODO
end

def cmp_flush *args
    # TODO
end

def cmp_fullhouse *args
    # TODO
end

def cmp_4of1kind *args
end

def cmp_stright_flush *args
    # TODO
end
