function checkPassword() {
    // alert("Hello");

    var resetPasswordForm = $("#resetPasswordForm");
    var originPassword = $("#originPassword");
    var newPassword = $("#newPassword");
    var reNewPassword = $("#reNewPassword");
    if (reNewPassword.val() != newPassword.val()) {
        alert("两次密码不一致！");
        resetPasswordForm.attr("action", "reset-password.jsp");
    }
}


function showProjectManagerPic1(planning, running, finished, sumProject) { // 项目经理的第一张图
    // alert(1);
    var BARCHART1 = $("#projectBarChart1");
    var barChartHome = new Chart(BARCHART1, {
        type: 'bar',
        options:
            {
                scales:
                    {
                        xAxes: [{
                            display: true
                        }],
                        yAxes: [{
                            display: true,
                            ticks:{
                              beginAtZero:true
                            },
                        }],
                    },
                legend: {
                    display: true
                }
            },
        data: {
            labels: ["筹划中", "进行中", "已完成", "总项目数"],
            datasets: [
                {
                    label: "项目统计",
                    backgroundColor: [
                        '#5499ca',
                        '#5499ca',
                        '#5499ca',
                        '#5499ca'
                    ],
                    borderColor: [
                        '#5499ca',
                        '#5499ca',
                        '#5499ca',
                        '#5499ca'
                    ],
                    borderWidth: 0,
                    data: [planning, running, finished, sumProject]
                }
            ]
        }
    });

    var radarChartExample = {
        responsive: true
    };

}

function showProjectManagerPic2(planning, running, finished, sumTask) { // 项目经理的第二张图
    // alert(running);
    // alert(finished);
    var BARCHART2 = $("#projectBarChart2");
    var barChartHome = new Chart(BARCHART2, {
        type: 'bar',
        options:
            {
                scales:
                    {
                        xAxes: [{
                            display: true
                        }],
                        yAxes: [{
                            display: true,
                            ticks:{
                                beginAtZero:true
                            },
                        }],
                    },
                legend: {
                    display: true
                }
            },
        data: {
            labels: ["未激活", "进行中", "已完成", "总任务数"],
            datasets: [
                {
                    label: "任务统计",
                    backgroundColor: [
                        '#5499ca',
                        '#5499ca',
                        '#5499ca',
                        '#5499ca'
                    ],
                    borderColor: [
                        '#5499ca',
                        '#5499ca',
                        '#5499ca',
                        '#5499ca'
                    ],
                    borderWidth: 0,
                    data: [planning, running, finished, sumTask]
                }
            ]
        }
    });

    var radarChartExample = {
        responsive: true
    };

}

function showProjectManagerPic3(failed, successful, sum) { // 项目经理的第三张图，测试用例评价
    var BARCHART3 = $("#projectBarChart3");
    var barChartHome = new Chart(BARCHART3, {
        type: 'bar',
        options:
            {
                scales:
                    {
                        xAxes: [{
                            display: true
                        }],
                        yAxes: [{
                            display: true,
                            ticks:{
                                beginAtZero:true
                            },
                        }],
                    },
                legend: {
                    display: true
                }
            },
        data: {
            labels: ["失败", "成功", "总Bug"],
            datasets: [
                {
                    label: "测试用例统计",
                    backgroundColor: [
                        '#5499ca',
                        '#5499ca',
                        '#5499ca'
                    ],
                    borderColor: [
                        '#5499ca',
                        '#5499ca',
                        '#5499ca'
                    ],
                    borderWidth: 0,
                    data: [failed,successful,sum]
                }
            ]
        }
    });

    var radarChartExample = {
        responsive: true
    };

}

function showProjectManagerPic4(unfinished, finished, sum) { // 项目经理的第四张图，bug评价
    var BARCHART4 = $("#projectBarChart4");
    var barChartHome = new Chart(BARCHART4, {
        type: 'bar',
        options:
            {
                scales:
                    {
                        xAxes: [{
                            display: true
                        }],
                        yAxes: [{
                            display: true,
                            ticks:{
                                beginAtZero:true
                            },
                        }],
                    },
                legend: {
                    display: true
                }
            },
        data: {
            labels: ["未完成", "已完成", "总Bug"],
            datasets: [
                {
                    label: "Bug统计",
                    backgroundColor: [
                        '#5499ca',
                        '#5499ca',
                        '#5499ca'
                    ],
                    borderColor: [
                        '#5499ca',
                        '#5499ca',
                        '#5499ca'
                    ],
                    borderWidth: 0,
                    data: [unfinished,finished,sum]
                }
            ]
        }
    });

    var radarChartExample = {
        responsive: true
    };

}

function Export(tableId){
    // alert(tableId);
    $("#"+tableId).table2excel({            //exceltable为存放数据的table
    // 不被导出的表格行的CSS class类
    exclude: ".noExl",
    // 导出的Excel文档的名称
    name: "表格-" + new Date().getTime(),
    // Excel文件的名称
    filename: "表格-" + new Date().getTime() + ".xls",
    bootstrap: false
});

}



