const convert = new Map([
  [ 'G', 'C', ],
  [ 'C', 'G', ],
  [ 'T', 'A', ],
  [ 'A', 'U' ],
]);

class DnaTranscriber {
  toRna(dna) {
    if (dna.match(/[^GCTA]/))
      throw new Error('Invalid input')
    return dna.split("").reduce((acc, strand) => acc + convert.get(strand), "")
  }
}

module.exports = DnaTranscriber;
