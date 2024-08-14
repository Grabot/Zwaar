<script>
	import { onMount } from "svelte";
    import Hexagon from "./Hexagon.svelte";

	export let colourIntensity;
	export let hexSize;

    colourIntensity = 0;
	var zwaarIntensity = colourIntensity + 255;

	var hexTileCenter;
    var hexTileSide1;
    var hexTileSide2;
    var hexTileSide3;
    var hexTileSide4;
    var hexTileSide5;
    var hexTileSide6;
	var hexImage = null;

	// Size of the hexagon and the internal dimensions of the svg viewBox. 
	let xSize = 2 * hexSize;
	let ySize = Math.sqrt(3) * hexSize;

    function setHexagonDetails() {
		// console.log("setting hex details with size: " + hexSize);
		// Size of the hexagon and the internal dimensions of the svg viewBox. 
		xSize = 2 * hexSize;
		ySize = Math.sqrt(3) * hexSize;
	}

	let pos_x_center = 0;
	let pos_y_center = 0;
    const q_center = -2;
    const r_center = 0;
    let pos_x_side1 = 0;
	let pos_y_side1 = 0;
    const q_side1 = -1;
    const r_side1 = -1;
    let pos_x_side2 = 0;
	let pos_y_side2 = 0;
    const q_side2 = -1;
    const r_side2 = 0;
    let pos_x_side3 = 0;
	let pos_y_side3 = 0;
    const q_side3 = -2;
    const r_side3 = 1;
    let pos_x_side4 = 0;
	let pos_y_side4 = 0;
    const q_side4 = -3;
    const r_side4 = 1;
    let pos_x_side5 = 0;
	let pos_y_side5 = 0;
    const q_side5 = -3;
    const r_side5 = 0;
    let pos_x_side6 = 0;
	let pos_y_side6 = 0;
    const q_side6 = -2;
    const r_side6 = -1;
    let pos_x_text_zwaar = 0;
	let pos_y_text_zwaar = 0;
    let pos_x_text_dev = 0;
	let pos_y_text_dev = 0;
	function getTilePos() {
		pos_x_center = xSize * 3 / 4 * q_center;
		let yTr1 = ySize / 2 * q_center;
		let yTr2 = ySize * r_center;
		pos_y_center = yTr1 + yTr2;

        pos_x_side1 = xSize * 3 / 4 * q_side1;
		yTr1 = ySize / 2 * q_side1;
		yTr2 = ySize * r_side1;
		pos_y_side1 = yTr1 + yTr2;

        pos_x_side2 = xSize * 3 / 4 * q_side2;
		yTr1 = ySize / 2 * q_side2;
		yTr2 = ySize * r_side2;
		pos_y_side2 = yTr1 + yTr2;

        pos_x_side3 = xSize * 3 / 4 * q_side3;
		yTr1 = ySize / 2 * q_side3;
		yTr2 = ySize * r_side3;
		pos_y_side3 = yTr1 + yTr2;

        pos_x_side4 = xSize * 3 / 4 * q_side4;
		yTr1 = ySize / 2 * q_side4;
		yTr2 = ySize * r_side4;
		pos_y_side4 = yTr1 + yTr2;

        pos_x_side5 = xSize * 3 / 4 * q_side5;
		yTr1 = ySize / 2 * q_side5;
		yTr2 = ySize * r_side5;
		pos_y_side5 = yTr1 + yTr2;

        pos_x_side6 = xSize * 3 / 4 * q_side6;
		yTr1 = ySize / 2 * q_side6;
		yTr2 = ySize * r_side6;
		pos_y_side6 = yTr1 + yTr2;

        pos_x_text_zwaar = pos_x_center;
        pos_y_text_zwaar = pos_y_center - 50;
        pos_x_text_dev = pos_x_center;
        pos_y_text_dev = pos_y_center + 50;
	}
	setHexagonDetails();
	getTilePos();

	function componentToHex(c) {
		var hex = c.toString(16);
		return hex.length == 1 ? "0" + hex : hex;
	}

	function rgbToHex(r, g, b) {
		return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
	}

	export const updateHexagon = function(hexagonSize) {
        // console.log("updateHexagon: " + hexagonSize);
		hexSize = hexagonSize;
		hexTileCenter.updateHexagon(hexagonSize);
        hexTileSide1.updateHexagon(hexagonSize);
        hexTileSide2.updateHexagon(hexagonSize);
        hexTileSide3.updateHexagon(hexagonSize);
        hexTileSide4.updateHexagon(hexagonSize);
        hexTileSide5.updateHexagon(hexagonSize);
        hexTileSide6.updateHexagon(hexagonSize);
        setHexagonDetails();
		getTilePos();
    }

    var hexagonColour = rgbToHex(
		Math.round(Math.random() * zwaarIntensity),
		Math.round(Math.random() * zwaarIntensity),
		Math.round(Math.random() * zwaarIntensity)
	);

    onMount(() => {

        hexTileCenter.updateHexagonColour(hexagonColour);
        hexTileSide1.updateHexagonColour(hexagonColour);
        hexTileSide2.updateHexagonColour(hexagonColour);
        hexTileSide3.updateHexagonColour(hexagonColour);
        hexTileSide4.updateHexagonColour(hexagonColour);
        hexTileSide5.updateHexagonColour(hexagonColour);
        hexTileSide6.updateHexagonColour(hexagonColour);

		const interval = setInterval(() => {
			hexagonColour = rgbToHex(
				Math.round(Math.random() * zwaarIntensity),
				Math.round(Math.random() * zwaarIntensity),
				Math.round(Math.random() * zwaarIntensity)
			);
            hexTileCenter.updateHexagonColour(hexagonColour);
            hexTileSide1.updateHexagonColour(hexagonColour);
            hexTileSide2.updateHexagonColour(hexagonColour);
            hexTileSide3.updateHexagonColour(hexagonColour);
            hexTileSide4.updateHexagonColour(hexagonColour);
            hexTileSide5.updateHexagonColour(hexagonColour);
            hexTileSide6.updateHexagonColour(hexagonColour);
		}, Math.round(200 + Math.random() * 1000));

		return () => {
			clearInterval(interval);
		};
	});

    function handleClick(e) {
		console.log("click event: " + e);
		// window.location.href="/terms";
	}

    function parentToggle() { 
        hexTileCenter.updateHexagonColourHover("#F00");
        hexTileSide1.updateHexagonColourHover("#F00");
        hexTileSide2.updateHexagonColourHover("#F00");
        hexTileSide3.updateHexagonColourHover("#F00");
        hexTileSide4.updateHexagonColourHover("#F00");
        hexTileSide5.updateHexagonColourHover("#F00");
        hexTileSide6.updateHexagonColourHover("#F00");
    }

</script>

<div class="hex_item" style='--pos_x:{pos_x_center};--pos_y:{pos_y_center};'>
    <Hexagon colourIntensity={zwaarIntensity} hexSize={hexSize} hexImage={hexImage} hexTileText={""} bind:this={hexTileCenter} logoHex={true} toggle={parentToggle} onClick={handleClick}></Hexagon>
</div>
<div class="hex_item" style='--pos_x:{pos_x_side1};--pos_y:{pos_y_side1};'>
    <Hexagon colourIntensity={zwaarIntensity} hexSize={hexSize} hexImage={hexImage} hexTileText={""} bind:this={hexTileSide1} logoHex={true} toggle={parentToggle} onClick={handleClick}></Hexagon>
</div>
<div class="hex_item" style='--pos_x:{pos_x_side2};--pos_y:{pos_y_side2};'>
    <Hexagon colourIntensity={zwaarIntensity} hexSize={hexSize} hexImage={hexImage} hexTileText={""} bind:this={hexTileSide2} logoHex={true} toggle={parentToggle} onClick={handleClick}></Hexagon>
</div>
<div class="hex_item" style='--pos_x:{pos_x_side3};--pos_y:{pos_y_side3};'>
    <Hexagon colourIntensity={zwaarIntensity} hexSize={hexSize} hexImage={hexImage} hexTileText={""} bind:this={hexTileSide3} logoHex={true} toggle={parentToggle} onClick={handleClick}></Hexagon>
</div>
<div class="hex_item" style='--pos_x:{pos_x_side4};--pos_y:{pos_y_side4};'>
    <Hexagon colourIntensity={zwaarIntensity} hexSize={hexSize} hexImage={hexImage} hexTileText={""} bind:this={hexTileSide4} logoHex={true} toggle={parentToggle} onClick={handleClick}></Hexagon>
</div>
<div class="hex_item" style='--pos_x:{pos_x_side5};--pos_y:{pos_y_side5};'>
    <Hexagon colourIntensity={zwaarIntensity} hexSize={hexSize} hexImage={hexImage} hexTileText={""} bind:this={hexTileSide5} logoHex={true} toggle={parentToggle} onClick={handleClick}></Hexagon>
</div>
<div class="hex_item" style='--pos_x:{pos_x_side6};--pos_y:{pos_y_side6};'>
    <Hexagon colourIntensity={zwaarIntensity} hexSize={hexSize} hexImage={hexImage} hexTileText={""} bind:this={hexTileSide6} logoHex={true} toggle={parentToggle} onClick={handleClick}></Hexagon>
</div>

<div class="logo_text" style='--pos_x:{pos_x_text_zwaar};--pos_y:{pos_y_text_zwaar};'>
    Zwaar
</div>
<div class="logo_text" style='--pos_x:{pos_x_text_dev};--pos_y:{pos_y_text_dev};'>
    Developers
</div>

<style>

    .logo_text {
		pointer-events: None;
        font-size: 3vw;
		position: absolute;
		top: 50%;
		left: 50%;

        transform: 
			translate(
				-50%,
				-50%
				)
			translate(
				calc( var(--pos_x) * 1px ),
				calc( var(--pos_y) * 1px )
				);
	}

	.hex_item {
		pointer-events: None;
		position: absolute;
		top: 50%;
		left: 50%;

        transform: 
			translate(
				-50%,
				-50%
				)
			translate(
				calc( var(--pos_x) * 1px ),
				calc( var(--pos_y) * 1px )
				);
	}

</style>
