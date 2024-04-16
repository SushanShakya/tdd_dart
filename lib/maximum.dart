int maximum(List<int> data) {
  if (data.isEmpty) return 0;
  if (data.length == 1) return data[0];
  var largest = data[0];
  for (var datum in data) {
    largest = largest > datum ? largest : datum;
  }
  return largest;
}
