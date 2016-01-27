$(function () {
    var seriesOptions = [],
        seriesCounter = 0,
        names = ['MSFT', 'AAPL', 'GOOG'];
    /**
     * Create the chart when all data is loaded
     * @returns {undefined}
     */
    function createChart() {
        $('#container').highcharts('StockChart', {
            rangeSelector: {
                selected: 4
            },
            yAxis: {
                labels: {
                    formatter: function () {
                        return (this.value > 0 ? ' + ' : '') + this.value + '%';
                    }
                },
                plotLines: [{
                    value: 0,
                    width: 2,
                    color: 'silver'
                }]
            },
            plotOptions: {
                series: {
                    compare: 'percent'
                }
            },
            tooltip: {
                pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.change}%)<br/>',
                valueDecimals: 2
            },
            series: seriesOptions
        });
    }
    $.each(names, function (i, name) {
        $.getJSON('https://www.highcharts.com/samples/data/jsonp.php?filename=' + name.toLowerCase() + '-c.json&callback=?',    function (data) {
            seriesOptions[i] = {
                name: name,
                data: data
            };
            // As we're loading the data asynchronously, we don't know what order it will arrive. So
            // we keep a counter and create the chart when all the data is loaded.
            seriesCounter += 1;
            if (seriesCounter === names.length) {
                createChart();
            }
        });
    });
});


$(function () {
    $('#pie').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: ''
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Stock',
            colorByPoint: true,
            data: [{
                name: 'MSFT',
                y: 56.33
            }, {
                name: 'AAPL',
                y: 24.03,
                sliced: true,
                selected: true
            }, {
                name: 'GOOG',
                y: 19.64
            }]
        }]
    });
});
