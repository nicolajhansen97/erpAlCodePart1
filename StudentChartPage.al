page 50402 "Student Chart";
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
      SourceTable = "Business Chart Buffer";


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; NameSource)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Chart Setup")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Chart Setup';
                Image = Setup;

                trigger OnAction()
                begin
                    Page.RunModal(Page::"Student Chart Setup Page");
                    UpdateChart();
                end;
            }
        }
    }

    var
     StudentChargMgt: CodeUnit "Student Chart Management";

local procedure UpdateChart()

begin
    StudentChartMgt.GenerateData(Rec);
    Update(CurrPage.BusinessChart);
end;    
}

