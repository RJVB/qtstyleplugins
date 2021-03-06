/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the QtWidgets module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL21$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 or version 3 as published by the Free
** Software Foundation and appearing in the file LICENSE.LGPLv21 and
** LICENSE.LGPLv3 included in the packaging of this file. Please review the
** following information to ensure the GNU Lesser General Public License
** requirements will be met: https://www.gnu.org/licenses/lgpl.html and
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** As a special exception, The Qt Company gives you certain additional
** rights. These rights are described in The Qt Company LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QGTK3PAINTER_P_H
#define QGTK3PAINTER_P_H

//
//  W A R N I N G
//  -------------
//
// This file is not part of the Qt API.  It exists purely as an
// implementation detail.  This header file may change from version to
// version without notice, or even be removed.
//
// We mean it.
//

#include <QtCore/qglobal.h>

#include "qgtkpainter_p.h"

QT_BEGIN_NAMESPACE

class QGtk3Painter : public QGtkPainter
{
public:
    QGtk3Painter();

    void paintBoxGap(GtkWidget *gtkWidget, const gchar* part, const QRect &rect,
                     GtkStateType state, GtkShadowType shadow, GtkPositionType gap_side, gint x,
                     gint width, GtkStyle *style) Q_DECL_OVERRIDE;
    void paintBox(GtkWidget *gtkWidget, const gchar* part,
                  const QRect &rect, GtkStateType state, GtkShadowType shadow, GtkStyle *style,
                  const QString &pmKey = QString()) Q_DECL_OVERRIDE;
    void paintHline(GtkWidget *gtkWidget, const gchar* part, const QRect &rect, GtkStateType state, GtkStyle *style,
                    int x1, int x2, int y, const QString &pmKey = QString()) Q_DECL_OVERRIDE;
    void paintVline(GtkWidget *gtkWidget, const gchar* part, const QRect &rect, GtkStateType state, GtkStyle *style,
                    int y1, int y2, int x, const QString &pmKey = QString()) Q_DECL_OVERRIDE;
    void paintExpander(GtkWidget *gtkWidget, const gchar* part, const QRect &rect, GtkStateType state,
                       GtkExpanderStyle expander_state, GtkStyle *style, const QString &pmKey = QString()) Q_DECL_OVERRIDE;
    void paintFocus(GtkWidget *gtkWidget, const gchar* part, const QRect &rect, GtkStateType state, GtkStyle *style,
                    const QString &pmKey = QString()) Q_DECL_OVERRIDE;
    void paintResizeGrip(GtkWidget *gtkWidget, const gchar* part, const QRect &rect, GtkStateType state, GtkShadowType shadow,
                         GdkWindowEdge edge, GtkStyle *style, const QString &pmKey = QString()) Q_DECL_OVERRIDE;
    void paintArrow(GtkWidget *gtkWidget, const gchar* part, const QRect &arrowrect, GtkArrowType arrow_type, GtkStateType state, GtkShadowType shadow,
                    gboolean fill, GtkStyle *style, const QString &pmKey = QString()) Q_DECL_OVERRIDE;
    void paintHandle(GtkWidget *gtkWidget, const gchar* part, const QRect &rect,
                     GtkStateType state, GtkShadowType shadow, GtkOrientation orientation, GtkStyle *style) Q_DECL_OVERRIDE;
    void paintSlider(GtkWidget *gtkWidget, const gchar* part, const QRect &rect, GtkStateType state, GtkShadowType shadow,
                     GtkStyle *style, GtkOrientation orientation, const QString &pmKey = QString()) Q_DECL_OVERRIDE;
    void paintShadow(GtkWidget *gtkWidget, const gchar* part, const QRect &rect, GtkStateType state, GtkShadowType shadow,
                     GtkStyle *style, const QString &pmKey = QString()) Q_DECL_OVERRIDE;
    void paintFlatBox(GtkWidget *gtkWidget, const gchar* part, const QRect &rect, GtkStateType state, GtkShadowType shadow, GtkStyle *style, const QString & = QString()) Q_DECL_OVERRIDE;
    void paintExtention(GtkWidget *gtkWidget, const gchar *part, const QRect &rect, GtkStateType state, GtkShadowType shadow,
                        GtkPositionType gap_pos, GtkStyle *style) Q_DECL_OVERRIDE;
    void paintOption(GtkWidget *gtkWidget, const QRect &rect, GtkStateType state, GtkShadowType shadow, GtkStyle *style, const QString &detail) Q_DECL_OVERRIDE;
    void paintCheckbox(GtkWidget *gtkWidget, const QRect &rect, GtkStateType state, GtkShadowType shadow, GtkStyle *style, const QString &detail) Q_DECL_OVERRIDE;

private:
    QPixmap renderTheme(uchar *bdata, uchar *wdata, const QRect &rect) const;

    GtkWidget *m_window;
};

QT_END_NAMESPACE

#endif // QGTK3PAINTER_P_H
