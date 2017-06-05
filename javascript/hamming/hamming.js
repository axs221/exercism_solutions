class Hamming {

  compute(left, right) {
    if (left.length !== right.length) {
      throw new Error('DNA strands must be of equal length.')
    }

    return Object.keys(left).reduce((acc, i) => {
      return left[i] !== right[i] ? acc + 1 : acc
    }, 0);
  }

}

module.exports = Hamming;
