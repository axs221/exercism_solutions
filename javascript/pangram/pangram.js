const letters = 'abcdefghijklmnopqrstuvwxyz'.split('');

class Pangram {
  constructor(phrase) {
    this.phrase = phrase.toLowerCase();
  }

  isPangram() {
    return letters.every((l) => this.phrase.indexOf(l) >= 0);
  }
}

module.exports = Pangram;
