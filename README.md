# NHCalendar swift练习写的 ，有不足的地方 共同交流提高
思路
1.今天的日期
2.这个月有几天
3.本月第一天是星期几

#//这里 之间把NHCalendarView添加到视图里就可以了
class ViewController: UIViewController,NHCalendarViewDelegate {
    override func viewDidLoad() {
    super.viewDidLoad()
    let view = NHCalendarView()
    view.frame = CGRectMake(0, 100, self.view.bounds.size.width, 250)
    view.delegate = self
    self.view.addSubview(view)
}
#//点击选择日期功能
func NHCalendarViewSelectDate(year: Int, month: Int, day: Int) {
    print("\(year)-\(month)-\(day)")
}
#增加闭包用法
NHCalendarView.show(self.view, frame: CGRectMake(0, 100, self.view.bounds.size.width, 250)) { (year, month, day) -> Void in
print("\(year)-\(month)-\(day)")
}
#便利构造器用法
self.calendar = NHCalendarView(frame: CGRectMake(0, 100, self.view.bounds.size.width, 250), view: self.view, selectDate: { (year, month, day) -> Void in
print("\(year)-\(month)-\(day)")
})
#增加回到今天功能
self.calendar?.backToDay()

#逐步完善一下功能 
1。点击选择时期，给出选择的效果
2。可自定义颜色和字体
3。增加事件日期功能
4. 可选闭包回调和代理回调2种
5.可多选日期