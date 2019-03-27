require 'car_example'

describe CarFactory do
  describe "#make_a_car" do
    it "makes a car" do
      car_double = double :car
      car_class_double = double :car_class, new: car_double

      car_factory = CarFactory.new(car_class_double)

      expect(car_double).to receive(:drive_away)
      car_factory.make_a_car
    end
  end
end
