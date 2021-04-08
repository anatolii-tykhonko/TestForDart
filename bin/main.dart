void main(List<String> arguments) {
  print(chooseBestDistance(174, 3, [51, 56, 58, 59, 61])); //173
  print(chooseBestDistance(163, 3, [50])); // -1
}

int chooseBestDistance(int t, int k, List<int> ls) {
  if (ls.length < k) {
    return -1;
  }
  var distanceBetweenCities = <int>[];
  var result = -1;
  var limitMaxDistance = t;
    distanceBetweenCities
        .addAll(calculateDistance(ls, k, 0, List.filled(k, 0), <int>[]));
  for (var i = 0; i < distanceBetweenCities.length; i++) {
    if (distanceBetweenCities[i] <= t) {
      if (t - distanceBetweenCities[i] < limitMaxDistance) {
        result = distanceBetweenCities[i];
        limitMaxDistance = t - distanceBetweenCities[i];
      }
    }
  }
  return result;
}

List<int> calculateDistance(List<int> arr, int len, int startPosition,
    List<int> result, List<int> distance) {
  var temp = 0;
  if (len == 0) {
    for (var i = 0; i < result.length; i++) {
      temp += result[i];
    }
    distance.add(temp);
  } else {
    for (var i = startPosition; i <= arr.length - len; i++) {
      result[result.length - len] = arr[i];
      calculateDistance(arr, len - 1, i + 1, result, distance);
    }
  }
  return distance;
}
