//
//  HistoWidget.swift
//  HistoWidget
//
//  Created by Furkan Hanci on 10/13/21.
//

import WidgetKit
import SwiftUI

struct WidgetModel : TimelineEntry {
    var date: Date
    var widgetData : [MainModel]
}


struct Provider : TimelineProvider {
    public var mainModel : MainModel
    func placeholder(in context: Context) -> WidgetModel {
        return WidgetModel(date: Date(), widgetData: Array(repeating: MainModel(year: "", text: "", html: "", noYearHTML: ""), count: 6))
        
     }

    func getSnapshot(in context: Context, completion: @escaping (WidgetModel) -> Void) {
        let loadingData = WidgetModel(date: Date(), widgetData: Array(repeating: MainModel(year: "", text: "", html: "", noYearHTML: ""), count: 6))
        
        completion(loadingData)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetModel>) -> Void) {
        getBirths { (modelData) in
            let date = Date()
            let data = WidgetModel(date: date, widgetData: modelData)
            
            let nextUpdate = Calendar.current.date(byAdding: .day, value: 1, to: date)
            let timeLine = Timeline(entries: [data], policy: .after(nextUpdate!))
            
            completion(timeLine)
        }

    }
    
    struct HistoWidgetView : View {
      internal let data : WidgetModel
        var body: some View {
            VStack {
                Text("Todays Births")
                    .font(.title)
                    .fontWeight(.bold)
                
                ForEach(data.widgetData, id: \.self) { model in
                    Text(model.year)
                }
            }
        }
    }

    @main
    struct MainWidget : Widget {
        var body: some WidgetConfiguration {
            StaticConfiguration(kind: "Histo", provider: Provider(mainModel: MainModel(year: "23984", text: "9ıfyuıd", html: "kjsakj", noYearHTML: "sakjfgjkas"))) { data in
                HistoWidgetView(data: data)
            }
            
            .description(Text("HistoriX"))
            .configurationDisplayName(Text("Daily Births"))
            .supportedFamilies([.systemLarge , .systemMedium])
        }
    }

    
    func getBirths(completion: @escaping ([MainModel]) -> Void) {
        let url = URL(string: "https://history.muffinlabs.com/date/\(DateService.shared.getCurrentMonth())/\(DateService.shared.getCurrentDay())")
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url!) { data, _, err in
            if err != nil {
                print(err?.localizedDescription)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode([MainModel].self, from: data!)
                
                completion(jsonData)
            } catch {
                print(err?.localizedDescription)
            }
        }
    }
}
