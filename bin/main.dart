void main(List<String> arguments) {
  print(chooseBestDistance(174, 3, [51, 56, 58, 59, 61])); //173
  print(chooseBestDistance(163, 3, [50])); // -1
}
int chooseBestDistance(int t, int k, List<int> ls) {
  if(ls.length < k){
    return -1;
  }
  var distanceBetweenThreeCities = <int>[];
  var result = 0;
  var limitMaxDistance = t;
  for (var i = 0; i < ls.length; i++) {
    for (var j = i + 1; j < ls.length; j++) {
      for (var k = j + 1; k < ls.length; k++) {
        var dis = ls[i] + ls[j] + ls[k];
        distanceBetweenThreeCities.add(dis);
      }
    }
  }
  for (var i = 0; i < distanceBetweenThreeCities.length; i++) {
    if(distanceBetweenThreeCities[i] <= t){
      if(t - distanceBetweenThreeCities[i] < limitMaxDistance){
        result = distanceBetweenThreeCities[i];
        limitMaxDistance = t - distanceBetweenThreeCities[i];
      }
    }
  }
  return result;
}
