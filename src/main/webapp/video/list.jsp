<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>聊天室 – 杨宁佛学视频 – 易度门</title>
        <meta name="keywords" content="杨宁,杨宁老师,佛学视频,杨宁佛学,佛学视频下载" />
        <meta name="description" content="杨宁老师佛学视频 在线观看 - 易度门" />
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <link rel="stylesheet" href="/resources/video-js/video-js.min.css">
        <link rel="stylesheet" href="/resources/video-js/yidumen-player.css">
    </head>

    <body>
        <!--web head width:990px -->
        <%@include file="/WEB-INF/jspf/nav.jspf" %>
        <!--/web head -->

        <!--web container width:990px-->
        <div id="container">
            <div id="video_box_large">
                <video id="video-player"
                       class="video-js vjs-default-skin vjs-big-play-centered"
                       poster="/resources/web/images/bg_video.png">

                </video>
            </div>
            <h5 id="video_large_title" class="video_large_title"></h5>
            <div id="General_left">
                <dl id="video_list_area">
                    <dt>所有视频列表</dt>
                    <dd>
                        <ul>
                            <c:forEach var="video" items="${recommend}">
                                <li>${video.file} <a href="/video/${video.file}">${video.title}</a><span style="background:#dcfe7f;font-size:10px;color:#454545;border-radius:5px;">${video.sort}</span><span class="video_choice">&nbsp;</span></li>
                                    </c:forEach>
                                    <c:forEach var="video" items="${videos}">
                                <li>${video.file} <a href="/video/${video.file}">${video.title}</a><span style="background:#dcfe7f;font-size:10px;color:#454545;border-radius:5px;">${video.sort}</span></li>
                                    </c:forEach>
                        </ul>
                    </dd>
                </dl>
            </div>
            <div id="General_right">
                <h4>开示摘录</h4>
                <ul class="list">
                    <c:forEach var="video" items="${extract}">
                        <li><a href="/video/${video.file}">${video.title}</a></li>
                    </c:forEach>
                </ul>
                <%@include file="/WEB-INF/jspf/weibo.jspf" %>
                <%@include file="/WEB-INF/jspf/exchange.jspf" %>
            </div>
        </div>
        <!-- -->
        <!--web footer width:100% -->
        <%@include file="/WEB-INF/jspf/footer.jspf" %>
        <script type="text/javascript" src="/resources/video-js/video.js"></script>
        <script type="text/javascript" src="/resources/video-js/video.js"></script>
        <script type="text/javascript" src="/resources/video-js/lang/zh.js"></script>
        <script type="text/javascript" src="/resources/video-js/yidumen-player.js"></script>
        <script>
            var playlist = [
            <c:forEach begin="0" end="3" items="${videos}" var="video">
                {file: "${video.file}",
                    title: "${video.title}"
                },
            </c:forEach>
            ];
            var vjs = videojs("video-player", {
                "controls": true,
                "autoplay": true,
                "width": "100%",
                "height": "100%",
                plugins: {
                    ydmPlayer: playlist
                }
            });
        </script>
    </body>
</html>
