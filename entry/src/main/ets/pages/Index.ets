import {HpcTabs,HpcTabsController} from 'hpcwebtabs'


@Entry
@ComponentV2
struct Index {
  HPCController = new HpcTabsController()
  @Local urls: Array<string> = [
    'https://m.baidu.com/',
    'https://m.thepaper.cn/',
    'https://www.openharmony.cn/'
  ]
  @Local names: Array<[string, Resource]> = [
    ['百度新闻', $r('app.media.baidu')],
    ['澎湃新闻', $r('app.media.pengpai')],
    ['鸿蒙', $r('app.media.openharmony')]
  ];
  aboutToAppear(): void {
    console.log("Page first onappear")
  }
  build() {
    Column() {
      HpcTabs({
        WebUrl: this.urls,
        names: this.names,
        barMode: "fixed",
        tabController: this.HPCController,
        tabStyle: {
          indicatorWidthWrapTab: true,
          fontColorSelect: Color.Blue
        },
        onWebTabIndicatorBuilder: () => {
          this.TabIndicator()
        },
        onWebTabBarBuilder: (tab, index) => {
          this.TabItem(tab, index)
        }
      })
    }
  }

  @Builder
  TabIndicator(){
    Stack().width('100%').height('100%')
      .backgroundColor(Color.Gray).borderRadius(12)
  }


  @Builder
  TabItem(tab:[string, Resource],index:number){
    Column(){
      Image(tab[1]).width(20).margin({bottom:4})
      Text(tab[0])
        .fontColor(this.HPCController.selectedTabIndex == index ? Color.Black : Color.Gray)
        .fontWeight(this.HPCController.selectedTabIndex == index ? FontWeight.Medium : FontWeight.Normal)
        .fontSize(this.HPCController.selectedTabIndex == index ? 18 : 16)
        .animation({ duration: 300 })
    }
  }
}

