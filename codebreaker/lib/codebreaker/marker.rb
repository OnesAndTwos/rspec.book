module CodeBreaker

  class Marker

    def initialize(secret, guess = '1234')
      @guess, @secret = guess, secret
    end

    def exact_match_count
      (0..3).inject(0) do |count, index|
        count + (exact_match?(index) ? 1 : 0)
      end
    end

    def number_match_count
      total_match_count - exact_match_count
    end

    private

    def total_match_count
      secret = @secret.split('')

      @guess.split('').inject(0) do | new_count, digit|
        new_count + (try_delete(digit, secret) ? 1 : 0)
      end
    end

    def try_delete(digit, secret)
        secret.delete_at(secret.index(digit)) if secret.include? digit
    end

    def exact_match?(index)
      @guess[index] == @secret[index]
    end

    def number_match?(index)
      @secret.include?(@guess[index]) && @guess[index] != @secret[index]
    end

  end

end
