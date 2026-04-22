/****************************************************************************
** Meta object code from reading C++ file 'VarTreeView.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.18)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../../vartypes-src/vartypes/gui/VarTreeView.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'VarTreeView.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.18. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_VarTypes__VarTreeView_t {
    QByteArrayData data[13];
    char stringdata0[136];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_VarTypes__VarTreeView_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_VarTypes__VarTreeView_t qt_meta_stringdata_VarTypes__VarTreeView = {
    {
QT_MOC_LITERAL(0, 0, 21), // "VarTypes::VarTreeView"
QT_MOC_LITERAL(1, 22, 17), // "newItemChecksRows"
QT_MOC_LITERAL(2, 40, 0), // ""
QT_MOC_LITERAL(3, 41, 11), // "QModelIndex"
QT_MOC_LITERAL(4, 53, 6), // "parent"
QT_MOC_LITERAL(5, 60, 5), // "start"
QT_MOC_LITERAL(6, 66, 3), // "end"
QT_MOC_LITERAL(7, 70, 16), // "checkDataChanged"
QT_MOC_LITERAL(8, 87, 7), // "topLeft"
QT_MOC_LITERAL(9, 95, 11), // "bottomRight"
QT_MOC_LITERAL(10, 107, 6), // "search"
QT_MOC_LITERAL(11, 114, 4), // "text"
QT_MOC_LITERAL(12, 119, 16) // "nextSearchResult"

    },
    "VarTypes::VarTreeView\0newItemChecksRows\0"
    "\0QModelIndex\0parent\0start\0end\0"
    "checkDataChanged\0topLeft\0bottomRight\0"
    "search\0text\0nextSearchResult"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_VarTypes__VarTreeView[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    3,   34,    2, 0x09 /* Protected */,
       7,    2,   41,    2, 0x09 /* Protected */,
      10,    1,   46,    2, 0x0a /* Public */,
      12,    0,   49,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 3, QMetaType::Int, QMetaType::Int,    4,    5,    6,
    QMetaType::Void, 0x80000000 | 3, 0x80000000 | 3,    8,    9,
    QMetaType::Void, QMetaType::QString,   11,
    QMetaType::Void,

       0        // eod
};

void VarTypes::VarTreeView::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<VarTreeView *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->newItemChecksRows((*reinterpret_cast< const QModelIndex(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3]))); break;
        case 1: _t->checkDataChanged((*reinterpret_cast< const QModelIndex(*)>(_a[1])),(*reinterpret_cast< const QModelIndex(*)>(_a[2]))); break;
        case 2: _t->search((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 3: _t->nextSearchResult(); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject VarTypes::VarTreeView::staticMetaObject = { {
    QMetaObject::SuperData::link<QWidget::staticMetaObject>(),
    qt_meta_stringdata_VarTypes__VarTreeView.data,
    qt_meta_data_VarTypes__VarTreeView,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *VarTypes::VarTreeView::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *VarTypes::VarTreeView::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_VarTypes__VarTreeView.stringdata0))
        return static_cast<void*>(this);
    return QWidget::qt_metacast(_clname);
}

int VarTypes::VarTreeView::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
