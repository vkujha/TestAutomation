from xlutils.copy import copy
from xlrd import open_workbook
import json, ast
import xlrd
import json, ast


def ReadExcelData(MyList=[],*args):
    tupleList = []
    DataVales = MyList.split(', ')

    WorkbookName = str(ast.literal_eval(json.dumps(DataVales[0])))
    SheetName = str(ast.literal_eval(json.dumps(DataVales[1])))
    RowNumber = int(str(ast.literal_eval(json.dumps(DataVales[2]))))
    #UserName = str(ast.literal_eval(json.dumps(DataVales[2])))
    #Password = str(ast.literal_eval(json.dumps(DataVales[3])))


    i = RowNumber
    j = 0
    #ExcelFaileName = 'C:\Users\jyoti.tiwari\PycharmProjects\Robot-Script\Wellevate\TestSuites\EmersonEcologics.xls'
    workbook = xlrd.open_workbook(WorkbookName)
    worksheet = workbook.sheet_by_name(SheetName)
    num_rows = worksheet.nrows
    num_cols = worksheet.ncols
    print num_rows
    print num_cols
    #for i in range(1,num_rows):
    #tupleList.append(RowNumber)
    for j in range(0, num_cols):
            print i
            print j
            CellValue = worksheet.cell(RowNumber, j).value
            tupleList.append(CellValue)
            #tupleList.append(worksheet.cell(RowNumber, j))
    return tupleList





def appendExcel(MyList=[],*args):
    DataVales = MyList.split(', ')
    # WorkbookName = str(DataVales[0]).decode().replace('u','').replace('[u', '').replace(']', '').replace(''','').replace(''', '')
    # SheetName = str(DataVales[1]).decode().replace('u','').replace('[u', '').replace(']', '').replace(''','').replace(''', '')
    # rowx = int(str(DataVales[2]).decode().replace('u','').replace('[u', '').replace(']', '').replace(''','').replace(''', ''))
    # colx = int(str(DataVales[3]).decode().replace('u','').replace('[u', '').replace(']', '').replace(''','').replace(''', ''))
    # valuetbewrite = str(DataVales[4]).decode().replace('[u', '').replace(']', '').replace(''','').replace(''', '')

    WorkbookName = str(ast.literal_eval(json.dumps(DataVales[0])))
    SheetName = str(ast.literal_eval(json.dumps(DataVales[1])))
    rowx = int(str(ast.literal_eval(json.dumps(DataVales[2]))))
    colx = int(str(ast.literal_eval(json.dumps(DataVales[3]))))
    valuetbewrite = str(ast.literal_eval(json.dumps(DataVales[4])))
    print  WorkbookName
    print  SheetName
    print  rowx
    print  colx
    print  valuetbewrite
    book_ro = open_workbook(WorkbookName)
    book = copy(book_ro)  # creates a writeable copy
    sheet1 = book.get_sheet(SheetName)  # get a first sheet
    sheet1.write(rowx, colx, valuetbewrite)
    #sheet1.write(13, 1, '#ABC123')
    book.save(WorkbookName)

# function to return row and column number as an List
def getRowAndColumnNumbers(MyList=[],*args):
    DataVales = MyList.split(', ')
    toupleData=[];
    WorkbookName = str(ast.literal_eval(json.dumps(DataVales[0])))
    SheetName = str(ast.literal_eval(json.dumps(DataVales[1])))
    workbook = xlrd.open_workbook(WorkbookName)
    worksheet = workbook.sheet_by_name(SheetName)
    toupleData.append(worksheet.nrows)
    toupleData.append(worksheet.ncols)
    return toupleData;


#Function to return Row Number
def getRowNumber(MyList=[],*args):
    DataVales = MyList.split(', ')
    toupleData=[];
    WorkbookName = str(ast.literal_eval(json.dumps(DataVales[0])))
    SheetName = str(ast.literal_eval(json.dumps(DataVales[1])))
    workbook = xlrd.open_workbook(WorkbookName)
    worksheet = workbook.sheet_by_name(SheetName)
    toupleData.append(worksheet.nrows)
    return toupleData;



def splitwithSeperator(leter):
    DataList = []
    print leter
    words= leter.split('/')
    for i in range(len(words)):
        DataList.append(words[i].strip())
    print  DataList
    return DataList