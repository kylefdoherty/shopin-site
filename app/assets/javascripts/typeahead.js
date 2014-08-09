// instantiate the bloodhound suggestion engine
var products = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('prod'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  local: [
    { prod: "Kibble'n'Bits" },
    { prod: 'Chow Down' },
    { prod: 'Horse Bully Sticks' },
    { prod: 'Himalayan Kong' },
    { prod: 'Tugga War' }
  ]
});

// initialize the bloodhound suggestion engine
products.initialize();

// instantiate the typeahead UI
$('.products .typeahead').typeahead(null, {
  displayKey: 'prod',
  source: products.ttAdapter()
});