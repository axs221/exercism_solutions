class Isogram {
  constructor(phrase) {
    this.phrase = phrase;
  }

  isIsogram() {
    const letters = this.phrase.toLowerCase()
      .replace(/[ `~!@#$%^&*()-_=+\]\[:"';\/?,.><]/g, '');
    return letters.length === new Set(letters.toLowerCase().split("")).size
  }
}

module.exports = Isogram;
