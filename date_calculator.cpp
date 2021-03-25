#include "date_calculator.h"

Date_calculator::Date_calculator(QObject *parent) : QObject(parent)
{
    m_date_format = "dd.MM.yyyy";
}

void Date_calculator::getDataFromQML_P1(QString prod_date, int shelf_time)
{

    m_prod_date = QDate::fromString(prod_date, m_date_format);
    m_shelf_life = shelf_time;
//    calculate();
}

int Date_calculator::getDataFromQML_P2(QString prod_date, QString exp_date)
{
    m_prod_date = QDate::fromString(prod_date, m_date_format);
    m_expiration_date = QDate::fromString(exp_date, m_date_format);
    m_calc_result = m_prod_date.daysTo(m_expiration_date);
    qDebug()<<m_prod_date<<" "<<m_expiration_date<<" "<<m_calc_result;

    return m_calc_result;
}

QString Date_calculator::calculate()
{
    m_expiration_date = m_prod_date.addDays(m_shelf_life);
    QDate today = QDate::currentDate();
    m_calc_result = today.daysTo(m_expiration_date);

    QString exp_date = m_expiration_date.toString(m_date_format);
    return exp_date;
}

//QString Date_calculator::getExpirationDate()
//{
//    QString exp_date = m_expiration_date.toString(m_date_format);
//    return exp_date;
//}

bool Date_calculator::isFresh()
{
    return m_calc_result > 0 ? true : false;
}

int Date_calculator::days_to_expire()
{
    //умножаю на -1, чтобы показать положительное количество дней, даже если товар просрочен
    return m_calc_result > 0 ? m_calc_result : m_calc_result *= -1;
}
