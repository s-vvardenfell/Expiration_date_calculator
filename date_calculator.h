#ifndef DATE_CALCULATOR_H
#define DATE_CALCULATOR_H

#include <QObject>
#include <QDate>
#include <QDebug>

/*
 логика 1:
 вводим дату производства + срок годности =
                дата истечения срока годности > сегодня ? просрочен : годен

 логика 2:
 вводим дату производства, дату окончания сг, получаем остаток дней
    если остаток меньше 0, то просрочен (или меньше 1)
*/

class Date_calculator : public QObject
{
Q_OBJECT

public:
    explicit Date_calculator(QObject *parent = nullptr);

private:

    bool m_is_expired=false;

    QDate m_prod_date;
    QDate m_expiration_date;
    QString m_date_format;
    int m_shelf_life, m_calc_result;



public slots:
    void getDataFromQML_P1(QString prod_date, int shelf_time);
    int getDataFromQML_P2(QString prod_date, QString exp_date);
    QString calculate();
    bool isFresh();
    int days_to_expire();

};

#endif // DATE_CALCULATOR_H
