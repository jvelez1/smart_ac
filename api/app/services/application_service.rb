class ApplicationService
  private

  def result(valid, resp)
    OpenStruct.new(valid?: valid, response: resp)
  end
end
