//
//  DataServices.swift
//  pwcs
//
//  Created by Zhilei Zheng on 1/20/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import Foundation
import TimelineTableViewCell

class DataServices {
    
    static let shared = DataServices()
    
    private var panels = [PanelType : Panel]()
    private var panelSpeakers = [PanelType : [Speaker]]()
    private var rawPanels = [Panel]()
    private var rawSpeakers = [Speaker]()
    private var rawEvents = [Event]()
    private var schedules = [Int: [(TimelinePoint, UIColor, String, String, String?, String?, String?)]]()
    
    init() {
        readInPanels()
        readInSpeakers()
        readInSchedule()
        readInEvents()
    }
    
    func getSpeakers(for panelType : PanelType) -> [Speaker] {
        guard let speakers = panelSpeakers[panelType] else {
            return []
        }
        return speakers
    }
    
    func getPanel(for panelType : PanelType) -> Panel {
        guard let panel = panels[panelType] else {
            return Panel(name: "other", location: LocationType.special, time: "TBA", background: #imageLiteral(resourceName: "event-bg"), desc: "TBA")
        }
        return panel
    }
    
    func getPanels() -> [Panel] {
//        var results = [Panel]()
//        for (_ , panel) in panels {
//            results.append(panel)
//        }
//        return results
        return rawPanels
    }
    
    func getEvents() -> [Event] {
        return rawEvents
    }
    
    func getSchedule(for day : Int) -> [(TimelinePoint, UIColor, String, String, String?, String?, String?)]{
        guard let schedule = schedules[day] else {
            return [(TimelinePoint(), UIColor.black, "Other", "TBA", nil, nil, nil)]
        }
        return schedule
    }
    
    private func readInSpeakers() {
        readInRawSpeakers()
        for speaker in rawSpeakers {
            if panelSpeakers[speaker.panelType] == nil {
                panelSpeakers[speaker.panelType] = [Speaker]()
            }
            panelSpeakers[speaker.panelType]?.append(speaker)
        }
    }
    
    private func readInRawSpeakers() {
        rawSpeakers.append(Speaker(name: "Ying Fu", title: "Former Chinese Foreign Minster", desc: "Fu Ying became the Chairperson of the Foreign Affairs Committee of the National People’s Congress of China in March 2013, having joined China’s Foreign Service in the late 1970s. In 1992 in Cambodia, she became China’s first civilian UN peacekeeper and hence the start of her decade-long engagement with Asian affairs.  From 1993 to 2004, she served successively as the Director, Counselor of the Foreign Ministry’s Asian Department, Minister Counselor of the Chinese Embassy in Indonesia (1997), China’s Ambassador to the Philippines (1998), and head of the Foreign Ministry’s Asian Department (2000). She was appointed the Chinese Ambassador to Australia in 2004 and later Ambassador to the United Kingdom in 2007. From 2009 to 2013, she served as the Vice Minister of Foreign Affairs. She is now the Chair of Academic Committee of the newly established China’s Institute of International Strategy (CIIS) of Chinese Academy of Social Sciences (CASS), and specially invited Vice Chairman of China Center for International Economic Exchanges (CCIEE).", img: #imageLiteral(resourceName: "speaker-fu-ying"), panelType: .openingCeremony))
        rawSpeakers.append(Speaker(name: "Baoguo Zhu", title: " Founder and Chairman of Joincare and Livzon Pharmaceutical Group", desc: "Mr. Zhu dedicates a third of his time to philanthropy over the past decade. He serves as the core initiator and participant of The Paradise International Foundation (TaoHuaYuan); Secretary general and trustee of The Nature Conservancy’s China Global Conservation Fund Board Committee. Besides Pharmaceutical business, Mr. Zhu is also known as the joint founder with Tencent’s Webank.", img: #imageLiteral(resourceName: "speaker_baoguo_zhu"), panelType: .openingCeremony))
        rawSpeakers.append(Speaker(name: "Guangchang Guo", title: "Chairman of Fosun International Limited Representitive of the 12th Chinese People's\nPolitical Consultataive Conference", desc: "郭广昌先生祖籍浙江省东阳市，1989 年毕业于复旦大学哲学系，于1999 年获复旦大学工商管理硕士学位。1992 年，郭广昌先生与四位同学共同创建复星，并一直担任董事长一职。2007 年，复星国际（00656.HK）在香港联交所成功上市。目前，复星已成为一家植根于中国，“具有全球产业整合与资产配置能力”的全球性跨国投资集团。在此基础之上，复星将以家庭客户的需求为中心，以科技引领，智造一个植根中国的全球幸福生态系统。近年来，复星一直坚持“中国动力嫁接全球资源”的发展逻辑，并聚焦于健康、快乐和富足等领域。在大健康领域，复星医药、国药控股均已处于国内医药行业龙头，复星还投资了像和睦家医疗、葡萄牙Luz Saúde医院连锁、达芬奇手术机器人、微医集团（原挂号网）、宝宝树等国内外优秀大健康企业；在快乐领域，复星在已有法国地中海俱乐部、三亚亚特兰蒂斯、加拿大太阳马戏团、美国好莱坞Studio 8 公司等基础上，仍在以客户需求为导向整合全球资源；在富足产业中，复星先后投资或创立了永安保险、复星保德信寿险、香港鼎睿再保险、复星联合健康保险、复星葡萄牙保险、德国H&A私人银行、美国AmeriTrust、葡萄牙BCP银行、浙江网商银行、香港复星恒利证券等，初步形成了一张全球服务的金融网络。除此之外，复星在全球地产行业积极推行“蜂巢城市”模式，包括上海外滩金融中心、纽约Liberty 28、米兰布罗吉大厦等全球地标性建筑。郭广昌先生还热心社会公益事业，复星集团也立志成为一家负责任的全球企业。在过去二十余年中，郭广昌先生与复星公益基金会多次向扶贫助学、抗震救灾等社会事业捐赠款物；郭广昌先生也一直致力于推动中国文化与全球的交流，已经促成了中国企业家在纽约、伦敦、巴黎、柏林的多次交流；同时，复星还尤其注重用商业的手段来支持全球年轻人的创新、创业活动，如在中国及欧洲共同启动的Protechting项目，已吸引全球青年创业者积极参与其中。", img: #imageLiteral(resourceName: "speaker_guangchang_guo"), panelType: .openingCeremony))
        rawSpeakers.append(Speaker(name: "Dr. Philipp Rösler", title: "Chief Executive Officer of Hainan Cihang Charity Foundation", desc:"Dr. Rösler was appointed the inaugural Chief Executive Officer of Hainan Cihang Charity Foundation, the New York-based charitable organization established by HNA Group, in December 2017.  Under Dr. Rösler’s stewardship, and building on HNA Group’s philanthropic heritage and commitment to social responsibility, the Foundation aims to become one of the world’s leading charitable organizations beginning with its work on the Global Empowerment Initiative, which focuses on education, entrepreneurship and health as the wellsprings through which to make a lasting difference in poverty relief, refugee aid and many other important philanthropic causes.Prior to his current role, Dr. Rösler was Head of Regional and Government Engagement and a Member of the Managing Board at the World Economic Forum, where he was deeply involved in its work to transform the global humanitarian system by 2030, including through the creation of public-private partnerships.Dr. Rösler served as Vice Chancellor of Germany and Federal Minister of Economics and Technology, and Chairman of Germany’s Free Democratic Party from 2011 to 2013.  During his time as Federal Minister of Economics and Technology, Dr. Rösler led efforts to expand vocational training and foster entrepreneurship, particularly in the German start-up community via the German Silicon Valley Accelerator program.  From 2009 to 2011, he held the role of Germany’s Federal Minister of Health.Dr. Rösler started his political career as Secretary of the FDP in the state of Lower Saxony and was elected as Chairman of the Lower Saxon FDP in 2006.  He was later appointed State Minister for Economic Affairs, Labour and Transport, and Deputy Prime Minister in the cabinet of Christian Wulff of Lower Saxony.Dr. Rösler trained as a combat medic in the German Bundeswehr (the Federal Defence Force), where he achieved the rank of Stabsarzt, equivalent to an army captain.  He received a Degree in Medicine and a Doctorate Degree in Cardiovascular Surgery from the Hanover Medical School, and Honorary Doctorates in Economy from the University of Hanoi and in International Relations from the University of Cambodia.Born in Vietnam and adopted as an infant by German parents, Dr. Rösler was Germany’s first cabinet minister of Asian heritage.", img: #imageLiteral(resourceName: "speaker_philip_rosler"), panelType: .openingCeremony))
        rawSpeakers.append(Speaker(name: "Mang Su", title: "CEO of the Trends Media Group publishing house, Editor-in-chief of Harper's Bazaar China", desc: "苏芒，时尚集团总裁，中国第一代时尚人，在杂志、广告、编辑、运营等方面拥有最全面的时尚媒体经验，以开创性和发展性著称，是中国最具传奇色彩的媒体人。1994年加入时尚，创办及管理运营十余本杂志，包括《时尚伊人》、《时尚先生》、《时尚家居》、《时尚健康》、《时尚芭莎》等，其中《时尚芭莎》以独创性的模式及迅猛的发展速度，开创了7本芭莎品牌系列杂志的先河，成为全球范围内的奇迹，旗下品牌《芭莎艺术》不仅成为全世界发行量最大的艺术杂志，并因此带动了八个国家《芭莎艺术》的诞生。在如今的新媒体时代，带领集团在数字、视频、活动等领域多方发展的同时，亦联手行业外众多顶级企业进行跨界设计合作，开创了新的传媒运营模式。她不仅在杂志行业不断创新、锐意进取，更是一位赋有社会责任感的女性。她于2003年创办芭莎明星慈善夜，开创中国时尚慈善的先河，结合以时尚、明星、企业、品牌为一体的新模式，11年来共募款过两亿，成为中国规模最大、影响力最大的慈善活动品牌，帮助无数贫困家庭获得新生，两次荣获国家最高慈善奖项——中华慈善奖，并于2013荣获CCTV年度慈善人物。她毕业于中国音乐学院，曾获长江商学院EMBA学位，在服务于时尚集团20年间，苏芒善于带领团队，以时尚的方式推动慈善、公益、娱乐、艺术等方面并做出卓越的贡献，是中国最资深的时尚领军人物。", img: #imageLiteral(resourceName: "speaker_mang_su"), panelType: .openingCeremony))
        
        rawSpeakers.append(Speaker(name: "Xudong Zhu", title: "Former Australia Premier", desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. ", img: #imageLiteral(resourceName: "speaker-xudong-zhu"), panelType: .realEstate))
        rawSpeakers.append(Speaker(name: "Kevin Rudd", title: "Former Australia Premier", desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. ", img: #imageLiteral(resourceName: "speaker-ying-shu-lin"), panelType: .closingCeremony))
        rawSpeakers.append(Speaker(name: "Kevin Rudd", title: "Former Australia Premier", desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. ", img: #imageLiteral(resourceName: "speaker-wang-xi"), panelType: .socialResponsibility))
        rawSpeakers.append(Speaker(name: "Kevin Rudd", title: "Former Australia Premier", desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. ", img: #imageLiteral(resourceName: "speaker-su-mang"), panelType: .finance))
    }
    
    private func readInPanels() {
        rawPanels.append(Panel(name: "Finance Panel", location: LocationType.annenburgCenter, time: "1:00PM - 2:30PM | Saturday", background: #imageLiteral(resourceName: "panel-bg-shanghai"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
        rawPanels.append(Panel(name: "Social Responsibility Panel", location: .irvineAuditorium, time: "1:00PM - 2:30PM | Saturday", background: #imageLiteral(resourceName: "panel-bg-1"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
        rawPanels.append(Panel(name: "International Relations Panel", location: .annenburgCenter, time: "3:00PM - 4:30PM | Saturday", background: #imageLiteral(resourceName: "panel-bg-beijing"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
        rawPanels.append(Panel(name: "Real Estate Panel", location: .irvineAuditorium, time: "3:00PM - 4:30PM | Saturday", background: #imageLiteral(resourceName: "panel-bg-la"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
        rawPanels.append(Panel(name: "Arts and Fashion Panel", location: .annenburgCenter, time: "10:00AM - 11:30AM | Sunday", background: #imageLiteral(resourceName: "panel-bg-chicago"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
        rawPanels.append(Panel(name: "Technology Panel", location: .irvineAuditorium, time: "10:00AM - 11:30AM | Sunday", background: #imageLiteral(resourceName: "panel-bg-seattle"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
    }
    
    private func readInEvents() {
        rawEvents.append(Event(name: "VIP Banquet", location: .special, time: "10:00AM - 11:00AM | Saturday", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", background: #imageLiteral(resourceName: "event-bg")))
        rawEvents.append(Event(name: "Recruiting Panel", location: .special, time: "9:00PM - 11:00PM | Friday", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", background: #imageLiteral(resourceName: "event-bg")))
        rawEvents.append(Event(name: "InnoTalk", location: .special, time: "12:00PM - 13:00PM | Sunday", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", background: #imageLiteral(resourceName: "event-bg")))
    }
    
    private func readInFAQ() {
        
    }
    
    private func readInSchedule() {
        schedules = [0:[
            (TimelinePoint(), UIColor.black, "Audience Registration", "2:00 PM - 6:00 PM\nHilton Inn At Penn\nAudience register arrival with staff. Summit brochure, and badge will be distributed.", "4 Hours", nil, "Sun"),
            (TimelinePoint(), UIColor.black, "Press Release", "4:00 PM - 6:00 PM\nSheraton in University City\nPresentation by representatives from the Summit Board and the Wharton school to media.", "2 Hours", nil, "Sun"),
            (TimelinePoint(), UIColor.black, "Career Fair and Panel Presentation", "6:00 PM - 8:00 PM\nHilton Inn At Penn\nPresentation by representatives from the Summit Board, Liepin and HR from participating companies.", "2 Hours", nil, "Sun"),
            (TimelinePoint(), UIColor.black, "Cocktail Social", "6:00 PM - 7:00 PM\nHuntsman Hall 8th Floor\nCocktail social co-hosted by Summit Board and the Wharton School.", "1 Hour", nil, "Sun"),
            (TimelinePoint(), UIColor.clear, "VIP Dinner", "7:00 PM - 9:00 PM\nHuntsman Hall 8th Floor\nBlack-tie dinner co-hosted by Summit Board and the Wharton School.", "2 Hours", "Apple", "Sun")
            ], 1:[
                (TimelinePoint(), UIColor.black, "Audience Registration - Regular", "8:00 AM = 10:00 AM\nLocation TBD\nAudience register arrival with staff. Summit brochure, and badge will be distributed.", "2 Hours", nil, "Sun"),
                (TimelinePoint(), UIColor.black, "Audience Registration - Late", "10:00 AM - 1:00 PM\nLocation TBD\nAudience register arrival with staff. Summit brochure, and badge will be distributed.", "3 Hours", "Apple", "Sun"),
                (TimelinePoint(), UIColor.clear, "Opening Ceremony", "9:00 AM - 11:00 AM\nIrvine Auditorium\nWelcoming speech will be given by Summit President and Dean of the Wharton School, followed by five keynote speakers.\nSpeakers: Fu Ying, Guo Guangchang, Zhu Baoguo, Su Mang, Philip Rosler", "2 Hours", nil, "Sun"),
                (TimelinePoint(), UIColor.clear, "Real Estate Panel", "12:30 PM - 2:30 PM\nAnnenberg Center\nSpeakers: Zhou Xin, Yuan Yue, Wang Xi, Wang Gehong", "2 Hours", nil, "Sun"),
                (TimelinePoint(), UIColor.clear, "Investment Panel", "12:30 PM - 2:30 PM\nIrvine Auditorium\nSpeakers: Albert Ng, Yup Kim, Yang Guang", "2 Hours", nil, "Sun"),
                (TimelinePoint(), UIColor.clear, "International Relations Panel", "3:00 PM - 5:00 PM\nAnnenberg Center\nSpeakers: Fu Ying，Kevin Rudd，Cui Tiankai", "2 Hours", nil, "Sun"),
                (TimelinePoint(), UIColor.clear, "Fashion and Entertainment Panel", "3:00 PM - 5:00 PM\nIrvine Auditorium\nSpeakers: Zhou Wen, Yang Ming, Su Mang", "2 Hours", nil, "Sun"),
                (TimelinePoint(), UIColor.clear, "Career Fair", "5:00 PM - 7:30 PM\nAnnenberg Center\nCareer Fair by participating companies, Audience can deliver resume and exchange contact.", "2 Hours 30 mins", nil, "Sun"),
                (TimelinePoint(), UIColor.clear, "INNO Talk", "7:00 PM - 9:00 PM\nAnnenberg Center\nConversation between startups, industry leaders and investors.", "2 Hours", nil, "Sun"),
                (TimelinePoint(), UIColor.clear, "Special Event and Social Innovation", "7:00 PM - 9:00 PM\nThe Study\nYoung global leaders sharing stories of innovation.", "2 Hours", "Apple", "Sun"),
            ], 2:[
                (TimelinePoint(), UIColor.black, "Corporate Sustainability and Social Responsibility Panel", "10:00 AM - 12:00 PM\nAnnenberg Center\nSpeakers: Zhu Xudong, Deng Fei, Wang Zhenyao, Pan Jiangxue", "2 Hours", nil, "Sun"),
                (TimelinePoint(), UIColor.black, "Blockchain and Application in China’s Economy Panel", "10:00 AM - 12:00 PM\nIrvine Auditorium\nSpeakers: Ying Shuling, Chen Weixing, Dai Kebin, Jeff Garzik", "2 Hours", nil, "Sun"),
                (TimelinePoint(), UIColor.black, "Closing Ceremony", "12:30 PM - 3:15 PM\nIrvine Auditorium\nClosing remarks will be given by Summit Vice President and Vice Dean of the Wharton School, followed by four keynote speakers.\nSpeakers: Cui Tiankai, Pete Walker, Wang Zhenyao", "2 Hours 45 mins", "Apple", "Sun")
            ]]
    }
    
}
