// import 'dart:math';

//Task 1
// Write a Dart program that generates the running product of elements in an iterable.

// void main() {
//   List<int> numbers = [1, 2, 3, 4, 5];
//   Iterable<int> runningProduct = generateRunningProduct(numbers);

//   print("Running Product: $runningProduct");
// }

// Iterable<int> generateRunningProduct(List<int> numbers) sync* {
//   int product = 1;

//   for (int number in numbers) {
//     product *= number;
//     yield product;
//   }
// }


//Task 2
//   List<int> numbers = [5, 1, 8, 2, 7, 3, 9, 4, 6];
//   int max = findMax(numbers);
//   int min = findMin(numbers);
//   print("Maximum value: $max");
//   print("Minimum value: $min");
// }

// int findMax(Iterable<int> numbers) {
//   int max = numbers.first;

//   for (int number in numbers) {
//     if (number > max) {
//       max = number;
//     }
//   }
//   return max;
// }

// int findMin(Iterable<int> numbers) {
//   int min = numbers.first;

//   for (int number in numbers) {
//     if (number < min) {
//       min = number;
//     }
//   }
//   return min;
// }


//Task 3
// class InfiniteRangeIterable extends Iterable<num> {
//   final num start;
//   final num step;
//   InfiniteRangeIterable(this.start, this.step);
//   @override
//   Iterator<num> get iterator {
//     return InfiniteRangeIterator(start, step);
//   }
// }
// class InfiniteRangeIterator implements Iterator<num> {
//   num current;
//   final num step;
//   InfiniteRangeIterator(this.current, this.step);
//   @override
//   bool moveNext() {
//     current += step;
//     return true;
//   }
// }
// void main() {
//   final start = 0;
//   final step = 2;
//   final infiniteRange = InfiniteRangeIterable(start, step);
//   final iterator = infiniteRange.iterator;
//   for (int i = 0; i < 10; i++) {
//     if (iterator.moveNext()) {
//       print(iterator.current);
//     }
//   }
// }


//Task 4
// class DropPositiveIterable<T> extends Iterable<T> {
//   final Iterable<T> _sourceIterable;
//   DropPositiveIterable(this._sourceIterable);
//   @override
//   Iterator<T> get iterator {
//     return DropPositiveIterator<T>(_sourceIterable.iterator);
//   }
// }
// class DropPositiveIterator<T> implements Iterator<T> {
//   final Iterator<T> _sourceIterator;
//   DropPositiveIterator(this._sourceIterator);
//   @override
//   T get current => _sourceIterator.current;
//   @override
//   bool moveNext() {
//     while (_sourceIterator.moveNext()) {
//       final value = _sourceIterator.current;
//       if (value is num && value > 0) {
//         continue;
//       } else {
//         return true; 
//       }
//     }
//     return false; 
//   }
// }
// void main() {
//   final iterable = [1, 2, 3, -1, -2, -3, 4, 5, 6];
//   final droppedIterable = DropPositiveIterable<int>(iterable);
//   print("Dropped elements :");
//   for (final value in droppedIterable) {
//     print(value);
//   }
// }


//Task 5
// Iterable<List<T>> permutations<T>(List<T> elements, int count) sync* {
//   if (count <= 0 || elements.isEmpty) return;
//   final totalPermutations = _factorial(elements.length);
//   for (var i = 0; i < min(totalPermutations, count); i++) {
//     final permutation = List<T>.from(elements);
//     var j = i;
//     for (var div = elements.length; div >= 1; div--) {
//       final index = j % div;
//       final temp = permutation[index];
//       permutation[index] = permutation[div - 1];
//       permutation[div - 1] = temp;
//       j ~/= div;
//


//Task 6
// String compressString(String input) {
//   if (input.isEmpty) return input;
//   StringBuffer compressed = StringBuffer();
//   int count = 1;
//   for (int i = 1; i < input.length; i++) {
//     if (input[i] == input[i - 1]) {
//       count++;
//     } else {
//       compressed.write(input[i - 1]);
//       if (count > 1) {
//         compressed.write(count);
//       }
//       count = 1;
//     }
//   }
//   compressed.write(input[input.length - 1]);
//   if (count > 1) {
//     compressed.write(count);
//   }
//   return compressed.toString();
// }
// void main() {
//   String input = "aabbbccddddddeeeee";
//   String compressed = compressString(input);

//   print("Original String: $input");
//   print("Compressed String: $compressed");
// }


//Task 7
// void main() {
//   final int givenNumber = 100;
//   final Iterable<int> numbers = Iterable<int>.generate(givenNumber, (index) => index + 1);
//   numbers.forEach((int i) {
//     if (i % 3 == 0 && i % 5 == 0) {
//       print("FizzBuzz");
//     } else if (i % 3 == 0) {
//       print("Fizz");
//     } else if (i % 5 == 0) {
//       print("Buzz");
//     } else {
//       print(i);
//     }
//   });
// }


//Task 8
// void main() {
//   final Iterable<int> years = Iterable<int>.generate(151, (index) => 2000 + index);
//   final Iterable<int> yearsWithSundayChristmas = years.where((year) {
//     final DateTime christmasDate = DateTime(year, 12, 25);
//     return christmasDate.weekday == DateTime.sunday;
//   });

//   print("25th of December is a Sunday in:");
//   yearsWithSundayChristmas.forEach((year) {
//     print(year);
//   });
// }


//Task 10
// List<int> shortestDistances(String input, String target) {
//   final List<int> distances = List<int>.filled(input.length, -1);
//   int targetIndex = -1;
//   for (int i = 0; i < input.length; i++) {
//     if (input[i] == target) {
//       targetIndex = i;
//     }
//     if (targetIndex != -1) {
//       distances[i] = i - targetIndex;
//     }
//   }
//   targetIndex = -1;
//   for (int i = input.length - 1; i >= 0; i--) {
//     if (input[i] == target) {
//       targetIndex = i;
//     }

//     if (targetIndex != -1) {
//       final int forwardDistance = targetIndex - i;
//       if (distances[i] == -1 || forwardDistance < distances[i]) {
//         distances[i] = forwardDistance;
//       }
//     }
//   }
//   return distances;
// }
// void main() {
//   final String input = "example input with e";
//   final String target = "e";
//   final List<int> distances = shortestDistances(input, target);

//   print("Shortest distances from '$target' in '$input': $distances");
// }


//Task 11
// int maxSameCharLength(String input) {
//   if (input.isEmpty) {
//     return 0;
//   }
//   int maxLength = 1;
//   final Iterable<String> characters = input.split('');
//   int currentLength = 1;
//   for (int i = 1; i < characters.length; i++) {
//     if (characters.elementAt(i) == characters.elementAt(i - 1)) {
//       currentLength++;
//     } else {
//       currentLength = 1;
//     }
//     if (currentLength > maxLength) {
//       maxLength = currentLength;
//     }
//   }
//   return maxLength;
// }
// void main() {
//   final String input = "aaabbbbcccccddddd";

//   final int maxLength = maxSameCharLength(input);

//   print("Maximum length: $maxLength");
// }


//Task 12
// List<int?> findTwoCharsSum(List<int> numbers, int targetSum) {
//   final Set<int> seenNumbers = {};
//   for (int number in numbers) {
//     int complement = targetSum - number;
//     if (seenNumbers.contains(complement)) {
//       return [number, complement];
//     }
//     seenNumbers.add(number);
//   }
//   return [null, null];
// }
// void main() {
//   final List<int> numberList = [2, 7, 11, 15];
//   final int targetSum = 9;

//   final List<int?> result = findTwoCharsSum(numberList, targetSum);

//   if (result[0] != null && result[1] != null) {
//     print("two elements with a sum of $targetSum are: ${result[0]} and ${result[1]}");
//   } else {
//     print("No two elements");
//   }
// }


//Task 13
// int maxDifference(List<int> numbers) {
//   if (numbers.isEmpty) {
//     return 0; // Return 0 for an empty list or a list with a single element
//   }
//   numbers.sort(); 
//   int maxDiff = numbers.last - numbers.first;

//   return maxDiff;
// }
// void main() {
//   final List<int> numberList = [5, 2, 9, 1, 7, 4];
//   final int maxPairDifference = maxDifference(numberList);
//   print("Maximum difference: $maxPairDifference");
// }