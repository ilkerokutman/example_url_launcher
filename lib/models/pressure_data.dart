class PressureReminderData {
  int unitIndex;
  int intervalIndex;
  int dayIndex;
  int hourVal;
  int minuteVal;
  String frontPartial;
  String frontFull;
  String rearPartial;
  String rearFull;

  PressureReminderData({
    this.unitIndex = 0,
    this.intervalIndex = 0,
    this.dayIndex = 1,
    this.hourVal = 15,
    this.minuteVal = 0,
    this.frontPartial = "30",
    this.frontFull = "32",
    this.rearPartial = "30",
    this.rearFull = "32",
  });

  factory PressureReminderData.fromMap(Map<String, dynamic> map) => PressureReminderData(
        unitIndex: map["unitIndex"] ?? 0,
        intervalIndex: map["intervalIndex"] ?? 1,
        dayIndex: map["dayIndex"] ?? 1,
        hourVal: map["hourVal"] ?? 15,
        minuteVal: map["minuteVal"] ?? 0,
        frontPartial: map["frontPartial"] ?? "32",
        frontFull: map["frontFull"] ?? "32",
        rearPartial: map["rearPartial"] ?? "32",
        rearFull: map["rearFull"] ?? "32",
      );

  Map<String, dynamic> toMap() => {
        "unitIndex": this.unitIndex,
        "intervalIndex": this.intervalIndex,
        "dayIndex": this.dayIndex,
        "hourVal": this.hourVal,
        "minuteVal": this.minuteVal,
        "frontPartial": this.frontPartial,
        "frontFull": this.frontFull,
        "rearPartial": this.rearPartial,
        "rearFull": this.rearFull,
      };
}
