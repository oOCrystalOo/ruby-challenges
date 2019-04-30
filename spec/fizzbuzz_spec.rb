# test fixture for Fizzbuzz class.
require_relative '../fizzbuzz'

describe 'fizzbuzz' do
  it 'should return "fizz" when passed value 3' do
    expect(fizzbuzz(3)).to eq 'fizz'
  end
  
  it 'should return "buzz" when passed value 5' do
    expect(fizzbuzz(5)).to eq 'buzz'
  end
  
  it 'should return "fizzbuzz" when passed value 15' do
    expect(fizzbuzz(15)).to eq 'fizzbuzz'
  end
  
  it 'should return given number when passed value of 2' do
    expect(fizzbuzz(2)).to eq 2
  end
  
  it 'should return "fizz" when passed multiple of 3' do
    expect(fizzbuzz(6)).to eq 'fizz'
  end
  
  it 'should return "buzz" when passed multiple of 5' do
    expect(fizzbuzz(25)).to eq 'buzz'
  end
  
  it 'should return "fizzbuzz" when passed multiple of 3 and 5' do
    expect(fizzbuzz(30)).to eq "fizzbuzz"
  end
  
  it 'should return given value when passed value not multiple of 3 nor 5' do
    expect(fizzbuzz(11)).to eq 11
  end
end