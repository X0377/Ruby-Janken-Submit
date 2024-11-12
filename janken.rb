#じゃんけん
JANKEN_HANDS = ['r', 's', 'p']

JANKEN_HANDS_DISPLAY = {
  'r' => "グー！👊",
  's' => "チョキ！✌️",
  'p' => "パー！🖐️"
}

def rock_paper_scissors
  puts "※「Ctrl＋C」で終了"
  puts "じゃんけん・・・"

  loop do
    puts "r:グー👊 / s:チョキ✌️ / p:パー🖐️ / q:戦わない"
    @player_hand = gets.chomp
    @computer_hand = JANKEN_HANDS.sample

    if @player_hand == "q"
      puts "ばいばーい！"
      puts "また遊ぼうね！"
      @janken_result = "quit"
      break
    end
    
    if @player_hand == "r" || @player_hand == "s" || @player_hand == "p"
      if @janken_result == "draw"
        puts "しょ！"
      else
        puts "ぽん！"
      end

      case @player_hand
      when "r"
        puts "---------------"
        puts "YOU:#{JANKEN_HANDS_DISPLAY['r']}"
        puts "COM:#{JANKEN_HANDS_DISPLAY[@computer_hand]}"
        puts "---------------"
        judge_rock_paper_scissors
      when "s"
        puts "---------------"
        puts "YOU:#{JANKEN_HANDS_DISPLAY['s']}"
        puts "COM:#{JANKEN_HANDS_DISPLAY[@computer_hand]}"
        puts "---------------"
        judge_rock_paper_scissors
      when "p"
        puts "---------------"
        puts "YOU:#{JANKEN_HANDS_DISPLAY['p']}"
        puts "COM:#{JANKEN_HANDS_DISPLAY[@computer_hand]}"
        puts "---------------"
        judge_rock_paper_scissors
      end
    else
      puts "r, s, p, qのどれかを選んでね！"
    end

    if @janken_result == "win" || @janken_result == "lose"
      break
    end
  end
end

#じゃんけん勝敗
def judge_rock_paper_scissors
  player_number = JANKEN_HANDS.index(@player_hand)
  computer_number = JANKEN_HANDS.index(@computer_hand)
  @result_number = player_number - computer_number

  case @result_number
  when 0
    puts "あいこで・・・"
    @janken_result = "draw"
  when -1, 2
    @janken_result = "win" 
  when -2, 1
    @janken_result = "lose"
  end
end


#あっち向いてホイ
ACCHIMUITE_DIRECTION = ['u', 'd', 'l', 'r']

ACCHIMUITE_DIRECTION_DISPLAY = {
  'u' => "上👆",
  'd' => "下👇",
  'l' => "左👈",
  'r' => "右👉"
}

def look_that_way
  loop do
    puts "あっち向いて・・・"
    puts "u:上👆 / d:下👇 / l:左👈 / r:右👉 / q:戦わない"
    @player_direction = gets.chomp
    @computer_direction = ACCHIMUITE_DIRECTION.sample

    if @player_direction == "q"
      puts "ばいばーい！"
      puts "また遊ぼうね！"
      @acchimuite_result = "quit"
      return
      
    elsif ACCHIMUITE_DIRECTION.include?(@player_direction)
      puts "ほい！"

      case @player_direction
      when "u"
        puts "---------------"
        puts "YOU:#{ACCHIMUITE_DIRECTION_DISPLAY['u']}"
        puts "COM:#{ACCHIMUITE_DIRECTION_DISPLAY[@computer_direction]}"
        puts "---------------"
        judge_look_that_way
        return
      when "d"
        puts "---------------"
        puts "YOU:#{ACCHIMUITE_DIRECTION_DISPLAY['d']}"
        puts "COM:#{ACCHIMUITE_DIRECTION_DISPLAY[@computer_direction]}"
        puts "---------------"
        judge_look_that_way
        return
      when "l"
        puts "---------------"
        puts "YOU:#{ACCHIMUITE_DIRECTION_DISPLAY['l']}"
        puts "COM:#{ACCHIMUITE_DIRECTION_DISPLAY[@computer_direction]}"
        puts "---------------"
        judge_look_that_way
        return
      when "r"
        puts "---------------"
        puts "YOU:#{ACCHIMUITE_DIRECTION_DISPLAY['r']}"
        puts "COM:#{ACCHIMUITE_DIRECTION_DISPLAY[@computer_direction]}"
        puts "---------------"
        judge_look_that_way
        return
      end

    else
      puts "u, d, l, r, qのどれかを選んでね！"
    end
  end
end

#あっち向いてほい勝敗
def judge_look_that_way
  if @janken_result == "win" && @player_direction == @computer_direction
    puts "YOU WIN!"
    @acchimuite_result = "win"
  elsif @janken_result == "lose" && @player_direction == @computer_direction
    puts "YOU LOSE..."
    @acchimuite_result = "lose"
  end
end

#ゲーム全体の流れ
def game_controller
  loop do
  rock_paper_scissors
  if @janken_result == "win" || @janken_result == "lose"
    look_that_way
    if @acchimuite_result == "win" || @acchimuite_result == "lose" || @acchimuite_result == "quit"
      break
    end
  elsif @janken_result == "quit"
    break
  end
end
end

#処理
game_controller
