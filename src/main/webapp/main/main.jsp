<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>GRÜNWELT</title>
    <%--<meta charset="utf-8">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>

    <%--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"--%>
    <%--      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">--%>
    <%--<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">--%>

    <script src="/webjars/jquery/3.5.1/dist/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.2/dist/js/bootstrap.min.js"></script>
    <%--<script src="/webjars/popper.js/1.16.0/dist/umd/popper.min.js"></script>--%>

    <link rel="stylesheet" href="/webjars/bootstrap/4.5.2/dist/css/bootstrap.min.css">

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>--%>
    <!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> -->

    <link rel='shortcut icon' type='image/x-icon' href='http://<%=rootAddress%>/image/favicon.ico'>
    <link rel="icon" type="image/x-icon" href="http://<%=rootAddress%>/image/favicon.ico">
    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }

        /* 기사 나란히 정렬 */
        @media screen and (min-width: 45em), print and (min-width: 45em) {
        }

        .row > .col {
            float: left;
        }

        /* 기사 나란히 정렬 */
        @media screen and (min-width: 45em), print and (min-width: 45em) {
        }

        .cols-3.row > .col {
            width: 33.33334%;
        }

        /* 기사 정렬부분 */
        .col {
            padding: 0 1em;
        }

        /* 기사 정렬부분 */
        .article3 {
            padding-left: 3ch;
            width: 275px;
        }

        .last {
            float: left;
        }


        /* 페이지 크기다를때 정렬바뀌는부 */
        @media screen and (min-width: 40em), print and (min-width: 40em) {
        }

        .cols-3 > .col:first-child {
            width: 100%;
        }

        /* 페이지 크기다를때 정렬바뀌는부 */
        @media screen and (min-width: 40em), print and (min-width: 40em) {
        }

        .cols-3 > .col {
            float: left;
            width: 50%;
        }

        /* 버튼 오른쪽정렬 */
        #writeButton {
            text-align: right;
        }

        /*footer */
        .text-center {
            text-align: center !important;
        }
    </style>
</head>

<script>

    history.replaceState({}, null, location.pathname);

</script>

<body>

    <!-- Navbar -->
    <jsp:include page="/inc/top.jsp" />
    <!-- /.navbar -->

    <!-- global news [emilia] start -->
    <div class="container" style="margin-top:30px">
        <div class="row">
            <div class="col-sm-12">
                <jsp:include page="/e/globalNews.jsp" />
                <br>
                <!-- global news [emilia] end -->

                <!-- 광고3개시작 -->
                <!-- eea [Finn] start -->
                <div class="row row-b cols-3" style="padding-bottom: 50px;">
                    <div class="col">
                        <div class="panel-pane pane-epa-core-html-pane">
                            <jsp:include page="/EeaController" />
                        </div>
                    </div>
                    <!-- eea [Finn] end -->

                    <!-- usepa [Dambi] start -->
                    <div class="col">
                        <div class="panel-pane pane-epa-core-html-pane">
                            <jsp:include page="/UsepaController" />

                        </div>
                    </div>
                    <!-- usepa [Dambi] end -->

                    <!-- unep [Benedict] start -->
                    <div class="col">
                        <div class="panel-pane pane-epa-core-html-pane">
                            <jsp:include page="/UnepController" />
                        </div>
                    </div>
                </div>
                <!-- unep [Benedict] end -->
                <!-- 광고3개끝 -->

                <!-- 이벤트시작 -->
                <div class="last col-sm-6">
                    <jsp:include page="/event/mainPageWerbung.jsp" />
                </div>
                <!-- 이벤트끝 -->

                <!-- 맵시작 -->
                <div class="last col-sm-6">
                    <!-- korea climate map [stefan] start -->
                    <jsp:include page="/s/koreaClimateMap.jsp" />
                    <!-- korea climate map [stefan] end -->
                </div>

            </div>
        </div>
    </div>
    <!-- 맵끝 -->

    <jsp:include page="/inc/bottom.jsp" />

</body>
</html>