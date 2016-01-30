class SentimentAnalysisController < ActionController::Base
  def create
    p '8'*100
    p params.inspect
    File.open("training.csv", "wb") { |f| f.write(training_data.read) }
    File.open("test.csv", "wb") { |f| f.write(test_data.read) }
    sample_model = `python try-tf-master/softmax.py --train training.csv --test test.csv --num_epochs 5 --verbose True`
    render plain: sample_model, status: :ok
  end

  private

  def test_data
    params.require('test_data')
  end

  def training_data
    params.require('training_data')
  end
end
