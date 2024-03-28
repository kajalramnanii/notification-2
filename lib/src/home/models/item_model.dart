class ItemModel {
  ItemModel({
    this.request,
    this.count,
    this.item,
  });

  ItemModel.fromJson(dynamic json) {
    request =
        json['request'] != null ? Request.fromJson(json['request']) : null;
    count = json['count'];
    if (json['item'] != null) {
      item = [];
      json['item'].forEach((v) {
        item?.add(Item.fromJson(v));
      });
    }
  }
  Request? request;
  num? count;
  List<Item>? item;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (request != null) {
      map['request'] = request?.toJson();
    }
    map['count'] = count;
    if (item != null) {
      map['item'] = item?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Item {
  Item({
    this.eventId,
    this.eventname,
    this.eventnameRaw,
    this.ownerId,
    this.thumbUrl,
    this.thumbUrlLarge,
    this.startTime,
    this.startTimeDisplay,
    this.endTime,
    this.endTimeDisplay,
    this.location,
    this.venue,
    this.label,
    this.featured,
    this.eventUrl,
    this.shareUrl,
    this.bannerUrl,
    this.score,
    this.categories,
    this.tags,
    this.tickets,
    this.customParams,
  });

  Item.fromJson(dynamic json) {
    eventId = json['event_id'];
    eventname = json['eventname'];
    eventnameRaw = json['eventname_raw'];
    ownerId = json['owner_id'];
    thumbUrl = json['thumb_url'];
    thumbUrlLarge = json['thumb_url_large'];
    startTime = json['start_time'];
    startTimeDisplay = json['start_time_display'];
    endTime = json['end_time'];
    endTimeDisplay = json['end_time_display'];
    location = json['location'];
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    label = json['label'];
    featured = json['featured'];
    eventUrl = json['event_url'];
    shareUrl = json['share_url'];
    bannerUrl = json['banner_url'];
    score = json['score'];
    categories =
        json['categories'] != null ? json['categories'].cast<String>() : [];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    tickets =
        json['tickets'] != null ? Tickets.fromJson(json['tickets']) : null;
    if (json['custom_params'] != null) {
      customParams = [];
      json['custom_params'].forEach((v) {
        customParams?.add(v);
      });
    }
  }
  String? eventId;
  String? eventname;
  String? eventnameRaw;
  String? ownerId;
  String? thumbUrl;
  String? thumbUrlLarge;
  num? startTime;
  String? startTimeDisplay;
  num? endTime;
  String? endTimeDisplay;
  String? location;
  Venue? venue;
  String? label;
  num? featured;
  String? eventUrl;
  String? shareUrl;
  String? bannerUrl;
  num? score;
  List<String>? categories;
  List<String>? tags;
  Tickets? tickets;
  List? customParams;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event_id'] = eventId;
    map['eventname'] = eventname;
    map['eventname_raw'] = eventnameRaw;
    map['owner_id'] = ownerId;
    map['thumb_url'] = thumbUrl;
    map['thumb_url_large'] = thumbUrlLarge;
    map['start_time'] = startTime;
    map['start_time_display'] = startTimeDisplay;
    map['end_time'] = endTime;
    map['end_time_display'] = endTimeDisplay;
    map['location'] = location;
    if (venue != null) {
      map['venue'] = venue?.toJson();
    }
    map['label'] = label;
    map['featured'] = featured;
    map['event_url'] = eventUrl;
    map['share_url'] = shareUrl;
    map['banner_url'] = bannerUrl;
    map['score'] = score;
    map['categories'] = categories;
    map['tags'] = tags;
    if (tickets != null) {
      map['tickets'] = tickets?.toJson();
    }
    if (customParams != null) {
      map['custom_params'] = customParams?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Tickets {
  Tickets({
    this.hasTickets,
    this.ticketUrl,
    this.ticketCurrency,
    this.minTicketPrice,
    this.maxTicketPrice,
  });

  Tickets.fromJson(dynamic json) {
    hasTickets = json['has_tickets'];
    ticketUrl = json['ticket_url'];
    ticketCurrency = json['ticket_currency'];
    minTicketPrice = json['min_ticket_price'];
    maxTicketPrice = json['max_ticket_price'];
  }
  bool? hasTickets;
  String? ticketUrl;
  String? ticketCurrency;
  num? minTicketPrice;
  num? maxTicketPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['has_tickets'] = hasTickets;
    map['ticket_url'] = ticketUrl;
    map['ticket_currency'] = ticketCurrency;
    map['min_ticket_price'] = minTicketPrice;
    map['max_ticket_price'] = maxTicketPrice;
    return map;
  }
}

class Venue {
  Venue({
    this.street,
    this.city,
    this.state,
    this.country,
    this.latitude,
    this.longitude,
    this.fullAddress,
  });

  Venue.fromJson(dynamic json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    fullAddress = json['full_address'];
  }
  String? street;
  String? city;
  String? state;
  String? country;
  num? latitude;
  num? longitude;
  String? fullAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['full_address'] = fullAddress;
    return map;
  }
}

class Request {
  Request({
    this.venue,
    this.ids,
    this.type,
    this.city,
    this.edate,
    this.page,
    this.keywords,
    this.sdate,
    this.category,
    this.cityDisplay,
    this.rows,
  });

  Request.fromJson(dynamic json) {
    venue = json['venue'];
    ids = json['ids'];
    type = json['type'];
    city = json['city'];
    edate = json['edate'];
    page = json['page'];
    keywords = json['keywords'];
    sdate = json['sdate'];
    category = json['category'];
    cityDisplay = json['city_display'];
    rows = json['rows'];
  }
  String? venue;
  String? ids;
  String? type;
  String? city;
  num? edate;
  num? page;
  String? keywords;
  num? sdate;
  String? category;
  String? cityDisplay;
  num? rows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['venue'] = venue;
    map['ids'] = ids;
    map['type'] = type;
    map['city'] = city;
    map['edate'] = edate;
    map['page'] = page;
    map['keywords'] = keywords;
    map['sdate'] = sdate;
    map['category'] = category;
    map['city_display'] = cityDisplay;
    map['rows'] = rows;
    return map;
  }
}
