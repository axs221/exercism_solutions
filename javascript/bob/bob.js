class Bob {
  hey(phrase) {
    // console.log(phrase, phrase.toUpperCase(), phrase === phrase.toUpperCase());
    // if (phrase.match(/^[A-Z0-9?!, ]+[A-Z]{2}[A-Z0-9?!, ]+$/)) {
    if (phrase.match(/[A-Z]{2}/) && phrase === phrase.toUpperCase()) {
      return 'Whoa, chill out!';
    } else if (phrase.endsWith('?')) {
      return 'Sure.';
    } else if (phrase.trim() === '') {
      return 'Fine. Be that way!';
    } else {
      return 'Whatever.';
    }
  }
}

module.exports = Bob;
