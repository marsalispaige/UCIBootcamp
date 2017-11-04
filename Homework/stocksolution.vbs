Sub stock_volume()

'declaring Var'
Dim volumeTotal As Double
Dim ticker As String
Dim lastrow As Double
Dim summaryRow As Long
Dim stockOpen As Double
Dim stockClose As Double

'Setting summaryrow for first entry'
summaryRow = 2

'determining last row of activesheet'
lastrow = ActiveSheet.Cells(ActiveSheet.Rows.Count, "A").End(xlUp).Row

'setting value for var'
volumeTotal = 0

'creating headers for summary table'
Cells(1, 10).Value = "Ticker"
Cells(1, 11).Value = "Yearly Change"
Cells(1, 12).Value = "Percent Change"
Cells(1, 13).Value = "Total Volume"

'for loop to loop through all stocks to pull information'
For i = 2 To lastrow

'checking if next stock is a not a match of current stock'
    If (Cells(i, 1).Value <> Cells(i + 1, 1).Value) Then
    
            'adding value to volume var'
            volumeTotal = volumeTotal + Cells(i, 7).Value
            
            'setting ticker symbole for ticker var'
            ticker = Cells(i, 1).Value
            
            'setting stockclose price for var'
            stockClose = Cells(i, 6).Value
            
            'building summary table'
            Cells(summaryRow, 10).Value = ticker
            
            'determining yearly change of open and close price'
            Cells(summaryRow, 11).Value = stockClose - stockOpen
            
            'determining percentage change between open and close price'
            Cells(summaryRow, 12).Value = (stockClose - stockOpen) / stockOpen
            Cells(summaryRow, 12).NumberFormat = "0.00%"
            
            'inputting volume total for stock'
            Cells(summaryRow, 13).Value = volumeTotal
            Cells(summaryRow, 13).NumberFormat = "0,000"
            
                        'setting conditional formatting for price change with a nested if statement'
                        If (Cells(summaryRow, 11).Value > 0) Then
                        
                                Cells(summaryRow, 11).Interior.ColorIndex = 4
                                
                                Else
                                
                                Cells(summaryRow, 11).Interior.ColorIndex = 3
                                
                        End If
                                
                        
            'resetting var values'
            volumeTotal = 0
            stockOpen = 0
            stockClose = 0
            
            'adding additional row to summary table'
            summaryRow = summaryRow + 1
        
        'grabbing the stock open price for new stock ticker if previous ticker does not match current'
        ElseIf (Cells(i, 1).Value <> Cells(i - 1, 1).Value) Then
        
                'setting stock open price'
                stockOpen = Cells(i, 3).Value
                
                'adding to volume total'
                volumeTotal = volumeTotal + Cells(i, 7).Value
            
        Else
            
            'adding to volume total'
             volumeTotal = volumeTotal + Cells(i, 7).Value
            
        End If
        
    Next i
    



End Sub
