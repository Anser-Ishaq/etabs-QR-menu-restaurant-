window.addEventListener("hideBsModal", function (event) {
    setTimeout(() => {
        hideBsModal(event, true);
    }, 1000);
    hideBsModal(event);
});

function hideBsModal(event, searchBackdrop = false) {
    if (searchBackdrop) {
        Array.from(document.getElementsByClassName("modal-backdrop")).forEach(
            (ele) => ele.remove()
        );
    }

    if (
        event &&
        "detail" in event &&
        event.detail &&
        typeof event.detail === "object" &&
        "id" in event.detail &&
        typeof event.detail.id === "string"
    ) {
        let ele = document.getElementById(event.detail.id);
        if (ele) {
            let myModal = bootstrap.Modal.getInstance(ele);
            if (myModal) {
                myModal.hide();
                return;
            }
        }
    }
}

function drawDonutChart(people, total) {
    const chart = document.getElementById("donutChart");
    const canvas = document.getElementById("donutCanvas");
    if (!chart || !canvas) {
        return;
    }

    const width = getWidthForCanvas();

    chart.style.setProperty("--l", `${width}px`);
    canvas.width = width;
    canvas.height = width;
    /** @type CanvasRenderingContext2D */
    const ctx = canvas.getContext("2d");
    const startAngle = 0;
    const endAngle = (people / total) * 2 * Math.PI;
    const center = width / 2;
    const outerRadius = center - 20; // Outer radius of the donut
    const innerRadius = center - 30; // Inner radius of the donut (change this to adjust thickness)

    // Clear canvas
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // Draw gray part
    ctx.beginPath();
    ctx.arc(center, center, outerRadius, endAngle, startAngle, false);
    ctx.arc(center, center, innerRadius, startAngle, endAngle, true);
    ctx.fillStyle = "#ccc";
    ctx.fill();

    // Draw black part
    ctx.beginPath();
    ctx.arc(center, center, outerRadius, startAngle, endAngle, false);
    ctx.arc(center, center, innerRadius, endAngle, startAngle, true);
    ctx.fillStyle = "#000";
    ctx.fill();

    // Draw white circle in the middle
    ctx.beginPath();
    ctx.arc(center, center, innerRadius, 0, 2 * Math.PI, false);
    ctx.fillStyle = "#fff";
    ctx.fill();
}

document.addEventListener("drawDonutChart", (event) => {
    // console.log(event);
    if (event["detail"]["people"] && event["detail"]["total"]) {
        setTimeout(
            () =>
                drawDonutChart(
                    event["detail"]["people"],
                    event["detail"]["total"]
                ),
            100
        );
    }
});
function convertRemToPixels(rem) {
    return (
        rem * parseFloat(getComputedStyle(document.documentElement).fontSize)
    );
}

function getWidthForCanvas() {
    let width = window.visualViewport.width;
    if (width > 500) {
        width = 500;
    }

    return width - convertRemToPixels(3);
}
