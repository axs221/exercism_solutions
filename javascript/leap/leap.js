//
// This is only a SKELETON file for the "Leap" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Year = function(input) {
  this.year = input;
};

// on every year that is evenly divisible by 4
//   except every year that is evenly divisible by 100
//     unless the year is also evenly divisible by 400

Year.prototype.isDivisibleBy = function(num) {
  return this.year % num === 0;
}

Year.prototype.isLeap = function() {
  return this.isDivisibleBy(4)
    && ( !this.isDivisibleBy(100) || this.isDivisibleBy(400) )
};

module.exports = Year;
