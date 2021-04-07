void main(List<String> arguments) {
  print(chooseBestDistance(174, 3, [51, 56, 58, 59, 61])); //173
  print(chooseBestDistance(163, 3, [50])); // -1
}
int chooseBestDistance(int t, int k, List<int> ls) {
  if(ls.length < k){
    return -1;
  }
  var distanceBetweenThreeCities = <int>[];
  var result = -1;
  var limitMaxDistance = t;
  for (var i = 0; i < ls.length; i++) {
        distanceBetweenThreeCities.add(calculateDistance(ls[i], k -1, ls.sublist(i+1, ls.length)));
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
int calculateDistance (int start, int countCity, List<int> dist){
  var result = start;
  if(countCity > 0 && dist.length >= countCity) {
    return calculateDistance (start + dist[0], countCity - 1, dist.sublist(1, dist.length));
  } else {
    return result;
  }
}
