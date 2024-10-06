public interface IReportBuilder
{
    void SetHeader(string header);
    void SetContent(string content);
    void SetFooter(string footer);
    void AddSection(string sectionName, string sectionContent);
    void SetStyle(ReportStyle style);
    Report GetReport();
}

public class Report
{
    public string Header { get; set; }
    public string Content { get; set; }
    public string Footer { get; set; }
    public Dictionary<string, string> Sections { get; private set; }
    public ReportStyle Style { get; set; }

    public Report()
    {
        Sections = new Dictionary<string, string>();
    }

    public void Export(string format)
    {
        if (format == "Text")
        {
            ExportToText();
        }
        else if (format == "HTML")
        {
            ExportToHtml();
        }
        else if (format == "PDF")
        {
            ExportToPdf();
        }
    }

    private void ExportToText()
    {
        Console.WriteLine("Exporting report to text format...");
        Console.WriteLine($"Header: {Header}");
        Console.WriteLine($"Content: {Content}");
        foreach (var section in Sections)
        {
            Console.WriteLine($"Section {section.Key}: {section.Value}");
        }
        Console.WriteLine($"Footer: {Footer}");
    }

    private void ExportToHtml()
    {
        Console.WriteLine("<html>");
        Console.WriteLine("<body style='background-color:" + Style.BackgroundColor + ";'>");
        Console.WriteLine("<h1>" + Header + "</h1>");
        Console.WriteLine("<p>" + Content + "</p>");
        foreach (var section in Sections)
        {
            Console.WriteLine($"<h2>{section.Key}</h2>");
            Console.WriteLine($"<p>{section.Value}</p>");
        }
        Console.WriteLine("<footer>" + Footer + "</footer>");
        Console.WriteLine("</body>");
        Console.WriteLine("</html>");
    }

    private void ExportToPdf()
    {
        // Используйте библиотеку iTextSharp или другую для создания PDF
        Console.WriteLine("Exporting report to PDF (this would generate a PDF file using iTextSharp or a similar library)...");
    }
}


public class ReportStyle
{
    public string BackgroundColor { get; set; }
    public string FontColor { get; set; }
    public int FontSize { get; set; }

    public ReportStyle(string backgroundColor, string fontColor, int fontSize)
    {
        BackgroundColor = backgroundColor;
        FontColor = fontColor;
        FontSize = fontSize;
    }
}


public class TextReportBuilder : IReportBuilder
{
    private Report _report = new Report();

    public void SetHeader(string header)
    {
        _report.Header = header;
    }

    public void SetContent(string content)
    {
        _report.Content = content;
    }

    public void SetFooter(string footer)
    {
        _report.Footer = footer;
    }

    public void AddSection(string sectionName, string sectionContent)
    {
        _report.Sections[sectionName] = sectionContent;
    }

    public void SetStyle(ReportStyle style)
    {
        _report.Style = style;
    }

    public Report GetReport()
    {
        return _report;
    }
}


public class HtmlReportBuilder : IReportBuilder
{
    private Report _report = new Report();

    public void SetHeader(string header)
    {
        _report.Header = header;
    }

    public void SetContent(string content)
    {
        _report.Content = content;
    }

    public void SetFooter(string footer)
    {
        _report.Footer = footer;
    }

    public void AddSection(string sectionName, string sectionContent)
    {
        _report.Sections[sectionName] = sectionContent;
    }

    public void SetStyle(ReportStyle style)
    {
        _report.Style = style;
    }

    public Report GetReport()
    {
        return _report;
    }
}


public class PdfReportBuilder : IReportBuilder
{
    private Report _report = new Report();

    public void SetHeader(string header)
    {
        _report.Header = header;
    }

    public void SetContent(string content)
    {
        _report.Content = content;
    }

    public void SetFooter(string footer)
    {
        _report.Footer = footer;
    }

    public void AddSection(string sectionName, string sectionContent)
    {
        _report.Sections[sectionName] = sectionContent;
    }

    public void SetStyle(ReportStyle style)
    {
        _report.Style = style;
    }

    public Report GetReport()
    {
        return _report;
    }
}


public class ReportDirector
{
    public void ConstructReport(IReportBuilder builder, ReportStyle style)
    {
        builder.SetStyle(style);
        builder.SetHeader("Annual Report 2024");
        builder.SetContent("This is the main content of the report.");
        builder.AddSection("Financial Overview", "Details about financial performance...");
        builder.AddSection("Market Analysis", "Details about market trends...");
        builder.SetFooter("Report generated on " + DateTime.Now);
    }
}



class Program
{
    static void Main(string[] args)
    {
        ReportDirector director = new ReportDirector();

        // Создаем текстовый отчет
        IReportBuilder textBuilder = new TextReportBuilder();
        ReportStyle textStyle = new ReportStyle("white", "black", 12);
        director.ConstructReport(textBuilder, textStyle);
        Report textReport = textBuilder.GetReport();
        textReport.Export("Text");

        // Создаем HTML-отчет
        IReportBuilder htmlBuilder = new HtmlReportBuilder();
        ReportStyle htmlStyle = new ReportStyle("lightblue", "black", 14);
        director.ConstructReport(htmlBuilder, htmlStyle);
        Report htmlReport = htmlBuilder.GetReport();
        htmlReport.Export("HTML");

        // Создаем PDF-отчет
        IReportBuilder pdfBuilder = new PdfReportBuilder();
        ReportStyle pdfStyle = new ReportStyle("white", "black", 12);
        director.ConstructReport(pdfBuilder, pdfStyle);
        Report pdfReport = pdfBuilder.GetReport();
        pdfReport.Export("PDF");
    }
}

