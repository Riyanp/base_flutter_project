class Page {
  int? currentPage;
  int? perPage;
  int? from;
  int? to;
  int? total;
  int? lastPage;
  bool? hasMorePages;

  Page({this.currentPage, this.perPage, this.from, this.to, this.total, this.lastPage, this.hasMorePages});

  Page.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    perPage = json['per_page'];
    from = json['from'];
    to = json['to'];
    total = json['total'];
    lastPage = json['last_page'];
    hasMorePages = json['has_more_pages'];
  }
}