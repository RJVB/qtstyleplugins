#ifdef __GNUC__
    __attribute__((used)) static const char *id_string = "$Id: @(#) " __FILE__ "@" __DATE__ " $";
#endif

/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the plugins of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or (at your option) the GNU General
** Public license version 3 or any later version approved by the KDE Free
** Qt Foundation. The licenses are as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL2 and LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-2.0.html and
** https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include <QtWidgets/qstyleplugin.h>
#include "qfusionstyle_p.h"

#include <QDebug>

QT_BEGIN_NAMESPACE

class QAltFusionStylePlugin : public QStylePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QStyleFactoryInterface" FILE "fusionstyle.json")
public:
    QStyle *create(const QString &key);
};

QStyle *QAltFusionStylePlugin::create(const QString &key)
{
    if (key.compare(QLatin1String("fusion"), Qt::CaseInsensitive) == 0
        || key.compare(QLatin1String("kfusion"), Qt::CaseInsensitive) == 0) {
        const auto ret = new QFusionStyle();
        qWarning() << Q_FUNC_INFO << ":" << ret;
        return ret;
    } else {
        qWarning() << Q_FUNC_INFO << "Ignoring key" << key;
    }

    return 0;
}

QT_END_NAMESPACE

#include "main.moc"

