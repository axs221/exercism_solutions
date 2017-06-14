class Gigasecond {
  constructor(myDate) {
    this.myDate = myDate;
  }

  date() {
    const d = new Date(this.myDate.getTime() + ( 1000000000 * 1000 ));
    return d;
  }
}

module.exports = Gigasecond;
