# NHCalendar
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

#逐步完善一下功能 
1。点击选择时期，给出选择的效果
2。可自定义颜色和字体
3。增加事件日期功能
4. 可选闭包回调和代理回调2种